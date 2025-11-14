


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
_date" class="form-control" required value="{{ old('invoice_date', date('Y-m-d')) }}">

