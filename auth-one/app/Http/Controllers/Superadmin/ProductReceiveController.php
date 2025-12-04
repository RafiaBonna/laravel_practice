<?php

namespace App\Http\Controllers\Superadmin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductReceive;
use App\Models\ProductReceiveItem;
use App\Models\ProductStock;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductReceiveController extends Controller
{
    // ============================
    // INDEX
    // ============================
    public function index()
    {
        $productReceives = ProductReceive::with('receiver', 'receivedBy')
            ->orderBy('id', 'desc')
            ->paginate(10);

        return view('superadmin.product_receives.index', compact('productReceives'));
    }

    // ============================
    // CREATE PAGE
    // ============================
    public function create()
    {
        $products = Product::where('is_active', 1)->pluck('name', 'id');
        $users = User::pluck('name', 'id');

        // Auto-generate receive number
        $lastReceive = ProductReceive::orderBy('id', 'desc')->first();
        $receive_no = 'PR-001';

        if ($lastReceive) {
            $lastNum = (int) filter_var($lastReceive->receive_no, FILTER_SANITIZE_NUMBER_INT);
            $receive_no = 'PR-' . str_pad($lastNum + 1, 3, '0', STR_PAD_LEFT);
        }

        return view('superadmin.product_receives.create', compact('products', 'users', 'receive_no'))
            ->with('receiveNos', [$receive_no]);
    }

    // ============================
    // STORE PRODUCT RECEIVE
    // ============================
    public function store(Request $request)
    {
        // Validate Request
        $request->validate([
            'receive_no' => 'required|string|unique:product_receives,receive_no',
            'receive_date' => 'required|date',
            'receiver_id' => 'required|exists:users,id',

            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|exists:products,id',

            // IMPORTANT → always use qty (NOT received_quantity)
            'items.*.qty' => 'required|numeric|min:0.01',

            'items.*.cost_rate' => 'nullable|numeric|min:0',
            'items.*.mrp' => 'nullable|numeric|min:0',
            'items.*.retail' => 'nullable|numeric|min:0',
            'items.*.distributor' => 'nullable|numeric|min:0',
            'items.*.depo_selling' => 'nullable|numeric|min:0',

            'items.*.batch_no' => 'nullable|string',
            'items.*.production_date' => 'nullable|date',
            'items.*.expiry_date' => 'nullable|date',
        ]);

        DB::beginTransaction();

        try {
            // Create ProductReceive Header
            $receive = ProductReceive::create([
                'receive_no' => $request->receive_no,
                'receive_date' => $request->receive_date,
                'receiver_id' => $request->receiver_id,
                'note' => $request->note,
                'received_by_user_id' => auth()->id(),
                'total_received_qty' => 0,
                'total_cost' => 0,
            ]);

            $totalQty = 0;
            $totalCost = 0;

            // LOOP ITEMS
            foreach ($request->items as $item) {

                $qty = (float) $item['qty'];
                $costRate = (float) ($item['cost_rate'] ?? 0);
                $itemCost = $qty * $costRate;

                // Insert into product_receive_items
                $receive->items()->create([
                    'product_receive_id' => $receive->id,
                    'product_id' => $item['product_id'],
                    'batch_no' => $item['batch_no'] ?? null,
                    'production_date' => $item['production_date'] ?? null,
                    'expiry_date' => $item['expiry_date'] ?? null,

                    'received_quantity' => $qty,

                    'mrp' => $item['mrp'] ?? 0,
                    'retail' => $item['retail'] ?? 0,
                    'distributor' => $item['distributor'] ?? 0,
                    'depo_selling' => $item['depo_selling'] ?? 0,

                    'cost_rate' => $costRate,
                    'total_item_cost' => $itemCost,
                ]);

                // Update Product Stock
                $stock = ProductStock::firstOrNew(['product_id' => $item['product_id']]);
                $stock->available_quantity = ($stock->available_quantity ?? 0) + $qty;
                $stock->save();

                // Accumulate totals
                $totalQty += $qty;
                $totalCost += $itemCost;
            }

            // Update totals in Header
            $receive->update([
                'total_received_qty' => $totalQty,
                'total_cost' => $totalCost,
            ]);

            DB::commit();

            return redirect()->route('superadmin.product-receives.index')
                ->with('success', 'Product Receive Entry Saved Successfully!');

        } catch (\Exception $e) {
            DB::rollBack();
            \Log::error("PRODUCT RECEIVE ERROR: " . $e->getMessage());

            return back()->withInput()->with('error', 'Failed to save. Check logs.');
        }
    }

    // ============================
    // SHOW PAGE
    // ============================
    public function show($id)
    {
        $productReceive = ProductReceive::with('items.product', 'receiver', 'receivedBy')
            ->findOrFail($id);

        return view('superadmin.product_receives.show', compact('productReceive'));
    }
}
