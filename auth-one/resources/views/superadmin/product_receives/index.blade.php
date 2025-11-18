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
            <table class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Receive No</th>
                        <th>Date</th>
                        <th>Receiver</th>
                        <th>Received By</th>
                        <th>Total Qty</th>
                        <th>Total Cost</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($productReceives as $receive)
                        <tr>
                            <td>{{ $receive->receive_no }}</td>
                            <td>{{ $receive->receive_date }}</td>
                            <td>{{ $receive->receiver->name ?? 'N/A' }}</td>
                            <td>{{ $receive->receivedBy->name ?? 'N/A' }}</td>
                            <td>{{ $receive->total_received_qty }}</td>
                            <td>{{ number_format($receive->total_cost ?? 0, 2) }}</td>
                            <td>
                                <a href="{{ route('superadmin.product-receives.show', $receive->id) }}" class="btn btn-sm btn-info">View</a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="mt-2">{{ $productReceives->links() }}</div>
        </div>
    </div>
</div>
@endsection
