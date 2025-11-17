@extends('master')

@section('content')
<div class="container-fluid">
    <div class="d-flex justify-content-between mb-3">
        <h3>Product Receive List</h3>
        <a href="{{ route('superadmin.product-receives.create') }}" class="btn btn-primary">+ New Receive</a>
    </div>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <div class="card">
        <div class="card-body">
            <table class="table table-bordered table-sm">
                <thead>
                    <tr>
                        <th>Receive No</th>
                        <th>Receive Date</th>
                        <th>Receiver</th>
                        <th>Total Qty</th>
                        <th>Note</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($productReceives as $receive)
                        <tr>
                            <td>{{ $receive->receive_no }}</td>
                            <td>{{ $receive->receive_date }}</td>
                            <td>{{ $receive->receiver->name ?? 'N/A' }}</td>
                            <td>{{ $receive->items->sum('qty') }}</td>
                            <td>{{ $receive->note }}</td>
                            <td>
                                <a href="{{ route('superadmin.product-receives.edit', $receive->id) }}" class="btn btn-sm btn-warning">Edit</a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>

            {{ $productReceives->links() }}
        </div>
    </div>
</div>
@endsection
