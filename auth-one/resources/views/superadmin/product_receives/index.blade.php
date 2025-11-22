@extends('master')

@section('content')
<div class="container-fluid">
    <div class="d-flex justify-content-between mb-3">
        {{-- Updated title from Sales Invoice List to Product Receive List --}}
        <h3>Product Receive List</h3>
        {{-- Assuming the route for creating a new receive is 'superadmin.product-receives.create' --}}
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
                        {{-- Updated column headers for Product Receive --}}
                        <th>Receive No</th>
                        <th>Date</th>
                        <th>Total Qty</th>
                        <th>Total Cost</th>
                        <th>Receiver</th>
                        <th>Received By</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    {{-- CORRECTED: Changed $invoices to $productReceives --}}
                    @forelse($productReceives as $receive)
                        <tr>
                            <td>{{ $receive->receive_no }}</td>
                            <td>{{ \Carbon\Carbon::parse($receive->receive_date)->format('d-M-Y') }}</td>
                            {{-- Displaying total_received_qty --}}
                            <td>{{ number_format($receive->total_received_qty ?? 0, 2) }}</td>
                            {{-- Displaying total_cost --}}
                            <td>{{ number_format($receive->total_cost ?? 0, 2) }}</td>
                            {{-- Receiver is the person/entity receiving the products --}}
                            <td>{{ $receive->receiver->name ?? 'N/A' }}</td>
                            {{-- receivedBy is the user who entered the data --}}
                            <td>{{ $receive->receivedBy->name ?? 'N/A' }}</td>
                            <td>
                                {{-- Assuming the show route for product receives is 'superadmin.product-receives.show' --}}
                                <a href="{{ route('superadmin.product-receives.show', $receive->id) }}" class="btn btn-sm btn-info">View</a>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="text-center">No product receive entries found.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>

            <div class="mt-2">
                {{-- CORRECTED: Changed $invoices to $productReceives --}}
                {{ $productReceives->links() }}
            </div>
        </div>
    </div>
</div>
@endsection