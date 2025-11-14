


<div class="container mt-4">
    <h4>Add Raw Material Purchase</h4>

    {{-- General Flash Messages --}}
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @elseif(session('error'))
        {{-- Display specific server-side errors --}}
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif
    
    {{-- Display ALL validation errors at the top for visibility --}}
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('superadmin.raw-material-purchases.store') }}" method="POST">
        @csrf

        {{-- INVOICE MASTER DATA --}}
        <div class="row mb-3">
            <div class="col-md-4">
                <label>Invoice Number</label>
                {{-- Use old() to retain value --}}
                <input type="text" name="invoice_number" class="form-control" required value="{{ old('invoice_number') }}">
                @error('invoice_number') <small class="text-danger">{{ $message }}</small> @enderror
            </div>
            <div class="col-md-4">
                <label>Invoice Date</label>
                <input type="date" name="invoice_date" class="form-control" required value="{{ old('invoice_date', date('Y-m-d')) }}">
                @error('invoice_date') <small class="text-danger">{{ $message }}</small> @enderror
            </div>
            <div class="col-md-4">
                <label>Supplier</label>
                <select name="supplier_id" class="form-control" required>
                    <option value="">-- Select Supplier --</option>
                    @foreach($suppliers as $supplier)
                        <option value="{{ $supplier->id }}" {{ old('supplier_id') == $supplier->id ? 'selected' : '' }}>{{ $supplier->name }}</option>
                    @endforeach
                </select>
                @error('supplier_id') <small class="text-danger">{{ $message }}</small> @enderror
            </div>
        </div>

        {{-- ITEMS TABLE --}}
        <table class="table table-bordered" id="itemsTable">
            <thead class="table-light">
                <tr>
                    <th>Existing Material</th>
                    <th>Unit</th>
                    <th>Qty</th>
                    <th>Unit Price</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                {{-- FIX: Loop through old items if available, otherwise show one default row --}}
                @php 
                    $items = old('items', [[]]); // At least one empty item if no old input
                    $rowIndex = 0;
                @endphp

                @foreach ($items as $index => $oldItem)
                <tr>
                    <td>
                        <select name="items[{{ $index }}][raw_material_id]" class="form-select raw-select">
                            <option value="">-- Select --</option>
                            @foreach($rawMaterials as $m)
                                <option 
                                    value="{{ $m->id }}" 
                                    data-unit="{{ $m->unit_of_measure }}"
                                    {{ (old("items.$index.raw_material_id") == $m->id) ? 'selected' : '' }}
                                >
                                    {{ $m->name }} ({{ $m->unit_of_measure }})
                                </option>
