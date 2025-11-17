<?php

namespace App\Http\Controllers\Superadmin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductReceive;
use App\Models\ProductReceiveItem;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; // <-- Add this line


class ProductReceiveController extends Controller
{
    public function create()
    {
        $products = Product::where('is_active', 1)->pluck('name', 'id');
        $users = User::pluck('name', 'id');

        $lastReceive = ProductReceive::orderBy('id', 'desc')->first();
        $nextReceiveNo = $lastReceive ? (int) $lastReceive->receive_no + 1 : 1;

        $receiveNos = ProductReceive::orderBy('id', 'desc')->pluck('receive_no')->toArray();
        array_unshift($receiveNos, $nextReceiveNo);

        return view('superadmin.product_receives.create', compact('products', 'users', 'receiveNos'));
    }

   public function store(Request $request)
{
    $request->validate([
        'receive_no' => 'required',
        'receive_date' => 'required|date',
        'receiver_id' => 'required|exists:users,id',
    ]);

    // Save the main receive
    $receive = ProductReceive::create([
        'receive_no' => $request->receive_no,
        'receive_date' => $request->receive_date,
        'receiver_id' => $request->receiver_id,
        'received_by_user_id' => Auth::id(), // <-- add this line
        'note' => $request->note,
    ]);

    // Save all items
    if ($request->has('items')) {
        foreach ($request->items as $item) {
            ProductReceiveItem::create([
                'product_receive_id' => $receive->id,
                'product_id' => $item['product_id'],
                'batch_no' => $item['batch_no'] ?? null,
                'qty' => $item['qty'] ?? 0,
                'mrp' => $item['mrp'] ?? 0,
                'retail' => $item['retail'] ?? 0,
                'distributor' => $item['distributor'] ?? 0,
                'depo_selling' => $item['depo_selling'] ?? 0,
                'cost_rate' => $item['cost_rate'] ?? 0,
                'production_date' => $item['production_date'] ?? null,
                'expiry_date' => $item['expiry_date'] ?? null,
            ]);
        }
    }

    return redirect()->route('superadmin.product-receives.index')
        ->with('success', 'Product receive saved successfully.');
}
    // Optional: Dynamic row fetch for AJAX
    public function getItemRow(Request $request)
    {
        $i = $request->i ?? 0;
        $products = Product::where('is_active', 1)->pluck('name', 'id');
        return view('superadmin.product_receives.partials.receive_item_row', compact('i', 'products'));
    }
}
