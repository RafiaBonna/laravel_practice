


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

