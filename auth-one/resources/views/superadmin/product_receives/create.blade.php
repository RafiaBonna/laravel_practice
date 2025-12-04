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

                {{-- Error Show --}}
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <div class="row">
                    <div class="col-md-3 form-group">
                        <label>Receive No <span class="text-danger">*</span></label>
                        <input type="text" name="receive_no" class="form-control"
                               value="{{ $receiveNos[0] ?? '' }}" required>
                    </div>

                    <div class="col-md-3 form-group">
                        <label>Receive Date <span class="text-danger">*</span></label>
                        <input type="date" name="receive_date" class="form-control"
                               value="{{ old('receive_date', date('Y-m-d')) }}" required>
                    </div>

                    <div class="col-md-3 form-group">
                        <label>Receiver <span class="text-danger">*</span></label>
                        <select name="receiver_id" class="form-control" required>
                            <option value="">Select Receiver</option>
                            @foreach($users as $id => $name)
                                <option value="{{ $id }}">{{ $name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-3 form-group">
                        <label>Note</label>
                        <input type="text" name="note" class="form-control">
                    </div>
                </div>

                <h5 class="mt-4">Product Items</h5>

                <div class="table-responsive">
                    <table class="table table-bordered table-sm">
                        <thead>
                        <tr>
                            <th>Product</th>
                            <th>Batch</th>
                            <th>Qty</th>
                            <th>MRP</th>
                            <th>Retail</th>
                            <th>Distributor</th>
                            <th>Depo</th>
                            <th>Cost</th>
                            <th>Production</th>
                            <th>Expiry</th>
                            <th>Action</th>
                        </tr>
                        </thead>

                        <tbody id="item-table-body">
                        <tr>
                            <td>
                                <select name="items[0][product_id]" class="form-control">
                                    <option value="">Select Product</option>
                                    @foreach($products as $id => $name)
                                        <option value="{{ $id }}">{{ $name }}</option>
                                    @endforeach
                                </select>
                            </td>

                            <td><input type="text" name="items[0][batch_no]" class="form-control"></td>

                            <td><input type="number" step="0.01" name="items[0][qty]"
                                       class="form-control received-qty" required></td>

                            <td><input type="number" step="0.01" name="items[0][mrp]" class="form-control"></td>

                            <td><input type="number" step="0.01" name="items[0][retail]" class="form-control"></td>

                            <td><input type="number" step="0.01" name="items[0][distributor]" class="form-control"></td>

                            <td><input type="number" step="0.01" name="items[0][depo_selling]" class="form-control"></td>

                            <td><input type="number" step="0.01" name="items[0][cost_rate]"
                                       class="form-control cost-rate"></td>

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

                <div class="form-group text-right mt-2">
                    <label>Total Received Qty</label>
                    <input type="text" id="total_received_qty" class="form-control text-right" value="0.00" readonly>
                </div>

                <div class="form-group text-right mt-2">
                    <label>Total Cost</label>
                    <input type="text" id="total_cost" class="form-control text-right" value="0.00" readonly>
                </div>

            </div>

            <div class="card-footer text-right">
                <button type="submit" class="btn btn-primary">Save Receive Entry</button>
            </div>
        </form>

        {{-- Hidden template --}}
        <table style="display:none;">
            <tr id="item-row-template">
                <td>
                    <select name="items[__INDEX__][product_id]" class="form-control">
                        <option value="">Select Product</option>
                        @foreach($products as $id => $name)
                            <option value="{{ $id }}">{{ $name }}</option>
                        @endforeach
                    </select>
                </td>

                <td><input type="text" name="items[__INDEX__][batch_no]" class="form-control"></td>

                <td><input type="number" step="0.01" name="items[__INDEX__][qty]"
                           class="form-control received-qty"></td>

                <td><input type="number" step="0.01" name="items[__INDEX__][mrp]" class="form-control"></td>

                <td><input type="number" step="0.01" name="items[__INDEX__][retail]" class="form-control"></td>

                <td><input type="number" step="0.01" name="items[__INDEX__][distributor]" class="form-control"></td>

                <td><input type="number" step="0.01" name="items[__INDEX__][depo_selling]" class="form-control"></td>

                <td><input type="number" step="0.01" name="items[__INDEX__][cost_rate]"
                           class="form-control cost-rate"></td>

                <td><input type="date" name="items[__INDEX__][production_date]" class="form-control"></td>

                <td><input type="date" name="items[__INDEX__][expiry_date]" class="form-control"></td>

                <td class="text-center">
                    <button type="button" class="btn btn-sm btn-danger remove-row">✖</button>
                </td>
            </tr>
        </table>

    </div>
</div>
@endsection

@section('scripts')
<script>
    let itemIndex = 1;

    $('#addNewItem').click(function () {
        let newRow = $('#item-row-template').clone().removeAttr('id').show();
        newRow.html(newRow.html().replace(/__INDEX__/g, itemIndex));
        $('#item-table-body').append(newRow);
        itemIndex++;
        updateTotals();
    });

    $(document).on('click', '.remove-row', function () {
        if ($('#item-table-body tr').length > 1) {
            $(this).closest('tr').remove();
            updateTotals();
        } else {
            alert('You must have at least one item.');
        }
    });

    function updateTotals() {
        let totalQty = 0;
        let totalCost = 0;

        $('#item-table-body tr').each(function () {
            let qty = parseFloat($(this).find('.received-qty').val()) || 0;
            let cost = parseFloat($(this).find('.cost-rate').val()) || 0;

            totalQty += qty;
            totalCost += qty * cost;
        });

        $('#total_received_qty').val(totalQty.toFixed(2));
        $('#total_cost').val(totalCost.toFixed(2));
    }

    $(document).on('input', '.received-qty, .cost-rate', function () {
        updateTotals();
    });
</script>
@endsection
