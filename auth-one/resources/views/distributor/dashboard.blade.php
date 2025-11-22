@extends('master')

@section('content')

    {{-- Header Section: Title and Period Filter --}}
    <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3">
        <h1 class="mb-0 text-dark">Distributor Sales Dashboard</h1>
        <div class="dropdown">
            <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="periodFilter" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-calendar-alt me-2"></i> Period: 01 Nov - 30 Nov
            </button>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="periodFilter">
                <li><a class="dropdown-item" href="#">Last 7 Days</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
            </ul>
        </div>
    </div>

    {{-- 1. Overview / Statistics Cards for Distributor --}}
    <div class="row mb-4">
        {{-- Card 1: Total Sales (to Customers) --}}
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card shadow border-start border-success border-4 h-100">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Sales (This Month)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">৳ 850,000</div>
                            <small class="text-success"><i class="fas fa-arrow-up"></i> +4.5% vs last month</small>
                        </div>
                        <div class="col-auto"><i class="fas fa-shopping-bag fa-2x text-gray-300"></i></div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Card 2: Target Achievement --}}
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card shadow border-start border-primary border-4 h-100">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Target Achievement</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">85%</div>
                            <small class="text-warning">Target: ৳ 1,000,000</small>
                        </div>
                        <div class="col-auto"><i class="fas fa-bullseye fa-2x text-gray-300"></i></div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Card 3: Pending Orders (from Depo) --}}
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card shadow border-start border-warning border-4 h-100">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending Orders from Depo</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">2</div>
                            <small class="text-muted">In Transit</small>
                        </div>
                        <div class="col-auto"><i class="fas fa-box-open fa-2x text-gray-300"></i></div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Card 4: Total Active Customers --}}
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card shadow border-start border-info border-4 h-100">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Total Active Customers</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">55</div>
                            <small class="text-muted">Last 30 Days</small>
                        </div>
                        <div class="col-auto"><i class="fas fa-users fa-2x text-gray-300"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

  <div class="row">
        {{-- Left Column (8/12) --}}
        <div class="col-xl-8 col-lg-7">
            
            {{-- 2. Sales Trend (Static Data) --}}
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Weekly Sales Trend</h6>
                </div>
                <div class="card-body">
                    <h6 class="text-muted mb-3">Sales Over Last 4 Weeks - Chart Placeholder</h6>
                    <div class="chart-bar">
                        <div style="position: relative; height: 250px; width: 100%; background-color: #f5f5f5; border: 1px dashed #ccc; display: flex; justify-content: center; align-items: center;">
                             <p class="text-muted">CHART PLACEHOLDER: Sales Line Chart</p>
                        </div>
                    </div>
                </div>
            </div>

            {{-- 4. Recent Customer Orders (Static Data) --}}
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Recent Customer Orders</h6>
                </div>
                <div class="card-body">
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                            <div><div class="fw-bold">ORD-1001</div><small class="text-muted">Customer X</small></div>
                            <span class="badge bg-success rounded-pill">৳ 5,500</span>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                            <div><div class="fw-bold">ORD-1002</div><small class="text-muted">Customer Y</small></div>
                            <span class="badge bg-success rounded-pill">৳ 3,200</span>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                            <div><div class="fw-bold">ORD-1003</div><small class="text-muted">Customer Z</small></div>
                            <span class="badge bg-success rounded-pill">৳ 7,800</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

       {{-- Right Column (4/12) --}}
        <div class="col-xl-4 col-lg-5">
            
            {{-- 3. Top Customers by Sales --}}
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Top 3 Customers (This Month)</h6>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush small">
                        <li class="list-group-item d-flex justify-content-between align-items-center">Store A <span class="badge bg-dark rounded-pill">৳ 120,000</span></li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">Shop B <span class="badge bg-dark rounded-pill">৳ 95,000</span></li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">Vendor C <span class="badge bg-dark rounded-pill">৳ 70,000</span></li>
                    </ul>
                </div>
            </div>
            
            {{-- 5. Stock Level Alert (Static Data) --}}
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-danger">Stock/Order Alerts</h6>
                </div>
                <div class="card-body">
                    <div class="alert alert-dark p-2 mb-2" role="alert">
                        <h6 class="alert-heading small fw-bold">Re-order Point!</h6>
                        <p class="mb-0 small">Product A (1Kg) needs re-ordering from Depo.</p>
                    </div>
                    <div class="alert alert-light p-2 mb-2" role="alert">
                        <h6 class="alert-heading small fw-bold">Order Received!</h6>
                        <p class="mb-0 small">Order ORD-1001 successfully delivered to Customer X.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- JavaScript Section for Charts (Placeholder only) --}}
@section('scripts')
    {{-- This section remains empty as the charts are static placeholders --}}
@endsection