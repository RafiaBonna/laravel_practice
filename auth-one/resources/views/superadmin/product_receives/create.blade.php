@extends('master')

@section('content')
<div class="container-fluid">
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">➕ New Product Receive Entry</h3>
        </div>

        <form action="{{ route('superadmin.product-receives.store') }}" method="POST">
            @csrf
            <div class="card-body">
                <div class="row">
                    <!-- Receive No -->
                    <div class="col-md-3 form-group">
                        <label>Receive No <span class="text-danger">*</span></label>
                        <select name="receive_no" class="form-control" required>
                            <option value="">-- Select Receive No --</option>
                            @foreach($receiveNos as $no)
                                <option value="{{ $no }}" {{ old('receive_no') == $no ? 'selected' : '' }}>
                                    {{ $no }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Receive Date -->
                    <div class="col-md-3 form-group">
                        <label>Receive Date <span class="text-danger">*</span></label>
                        <input type="date" name="receive_date" class="form-control" value="{{ old('receive_date', date('Y-m-d')) }}" required>
                    </div>

                    <!-- Receiver -->
                    <div class="col-md-3 form-group">
                        <label>Receiver <span class="text-danger">*</span></label>
                        <select name="receiver_id" class="form-control" required>
                            <option value="">-- Select Receiver --</option>
                            @foreach($users as $id => $name)
                                <option value="{{ $id }}" {{ old('receiver_id') == $id ? 'selected' : '' }}>
                                    {{ $name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Note -->
                    <div class="col-md-3 form-group">
                        <label>Note</label>
                        <input type="text" name="note" class="form-control" value="{{ old('note') }}">
                    </div>
                </div>

                <!-- Product Items Table -->
                <h5 class="mt-4">Product Items</h5>
                <div class="table-responsive">
                    <table class="table table-bordered table-sm">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Batch No</th>
                                <th>Qty</th>
                                <th>MRP</th>
                                <th>Retail</th>
                                <th>Distributor</th>
                                <th>Depo Selling</th>
                                <th>Cost Rate</th>
                                <th>Production Date</th>
                                <th>Expiry Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="item-table-body">
                            <!-- First Row -->
                            <tr>
                                <td>
                                    <select name="items[0][product_id]" class="form-control" required>
                                        <option value="">-- Select Product --</option>
                                        @foreach($products as $id => $name)
                                            <option value="{{ $id }}">{{ $name }}</option>
                                        @endforeach
                                    </select>
                                </td>
                                <td><input type="text" name="items[0][batch_no]" class="form-control"></td>
                                <td><input type="number" step="0.01" name="items[0][qty]" class="form-control received-qty"></td>
                                <td><input type="number" step="0.01" name="items[0][mrp]" class="form-control"></td>
                                <td><input type="number" step="0.01" name="items[0][retail]" class="form-control"></td>
                                <td><input type="number" step="0.01" name="items[0][distributor]" class="form-control"></td>
                                <td><input type="number" step="0.01" name="items[0][depo_selling]" class="form-control"></td>
                                <td><input type="number" step="0.01" name="items[0][cost_rate]" class="form-control"></td>
                                <td><input type="date" name="items[0][production_date]" class="form-control"></td>
                                <td><input type="date" name="items[0][expiry_date]" class="form-control"></td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-sm btn-danger remove-row">✖</button>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="11" class="text-right">
                                    <button type="button" id="addNewItem" class="btn btn-sm btn-success">+ Add Item</button>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <!-- Total Quantity -->
                <div class="form-group text-right mt-2">
                    <label>Total Received Qty</label>
                    <input type="text" id="total_received_qty" class="form-control text-right" value="0.00" readonly>
                </div>
            </div>

            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Save Receive Entry</button>
            </div>
        </form>

        <!-- Hidden Template Row -->
        <table style="display:none;">
            <tbody>
                <tr id="item-row-template">
                    <td>
                        <select name="items[__INDEX__][product_id]" class="form-control" required>
                            <option value="">-- Select Product --</option>
                            @foreach($products as $id => $name)
                                <option value="{{ $id }}">{{ $name }}</option>
                            @endforeach
                        </select>
                    </td>
                    <td><input type="text" name="items[__INDEX__][batch_no]" class="form-control"></td>
                    <td><input type="number" step="0.01" name="items[__INDEX__][qty]" class="form-control received-qty"></td>
                    <td><input type="number" step="0.01" name="items[__INDEX__][mrp]" class="form-control"></td>
                    <td><input type="number" step="0.01" name="items[__INDEX__][retail]" class="form-control"></td>
                    <td><input type="number" step="0.01" name="items[__INDEX__][distributor]" class="form-control"></td>
                    <td><input type="number" step="0.01" name="items[__INDEX__][depo_selling]" class="form-control"></td>
                    <td><input type="number" step="0.01" name="items[__INDEX__][cost_rate]" class="form-control"></td>
                    <td><input type="date" name="items[__INDEX__][production_date]" class="form-control"></td>
                    <td><input type="date" name="items[__INDEX__][expiry_date]" class="form-control"></td>
                    <td class="text-center">
                        <button type="button" class="btn btn-sm btn-danger remove-row">✖</button>
                    </td>
                </tr>
            </tbody>
        </table>

    </div>
</div>
@endsection

@section('scripts')
<script>
let itemIndex = 1; // start after first row

// Add new item
$('#addNewItem').click(function() {
    let template = $('#item-row-template').prop('outerHTML');
    template = template.replace(/__INDEX__/g, itemIndex);
    $('#item-table-body').append(template);
    itemIndex++;
});

// Remove row
$(document).on('click', '.remove-row', function(){
    $(this).closest('tr').remove();
    updateTotalQty();
});

// Update total quantity
function updateTotalQty() {
    let total = 0;
    $('.received-qty').each(function() {
        total += parseFloat($(this).val()) || 0;
    });
    $('#total_received_qty').val(total.toFixed(2));
}

$(document).on('input', '.received-qty', updateTotalQty);
</script>
@endsection
