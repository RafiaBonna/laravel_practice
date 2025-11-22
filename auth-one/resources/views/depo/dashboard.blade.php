@extends('master')

@section('content')

    {{-- Header Section: Title and Period Filter --}}
    <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3">
        <h1 class="mb-0 text-dark">Depo Operations Dashboard</h1>
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

    {{-- 1. Overview / Statistics Cards for Depo --}}
    <div class="row mb-4">
        {{-- Card 1: Total Product Received (from factory) --}}
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card shadow border-start border-primary border-4 h-100">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Product Received (Units)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">8,500</div>
                            <small class="text-success"><i class="fas fa-arrow-up"></i> +5.5% vs last month</small>
                        </div>
                        <div class="col-auto"><i class="fas fa-truck-loading fa-2x text-gray-300"></i></div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Card 2: Total Sales to Distributors --}}
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card shadow border-start border-success border-4 h-100">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Sales to Distributor (Taka)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">৳ 2,500,000</div>
                            <small class="text-success"><i class="fas fa-arrow-up"></i> +1.2% vs last month</small>
                        </div>
                        <div class="col-auto"><i class="fas fa-money-bill-wave fa-2x text-gray-300"></i></div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Card 3: Pending Invoices for Approval --}}
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card shadow border-start border-warning border-4 h-100">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending Invoice Approval</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">4</div>
                            <small class="text-muted">High Priority</small>
                        </div>
                        <div class="col-auto"><i class="fas fa-file-invoice fa-2x text-gray-300"></i></div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Card 4: Current Depo Stock Value --}}
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card shadow border-start border-info border-4 h-100">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Current Depo Stock Value</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">৳ 1,250,000</div>
                            <small class="text-muted">Estimated Cost</small>
                        </div>
                        <div class="col-auto"><i class="fas fa-warehouse fa-2x text-gray-300"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

  <div class="row">
        {{-- Left Column (8/12) --}}
        <div class="col-xl-8 col-lg-7">
            
            {{-- 2. Depo Inventory Movement (Static Data) --}}
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Monthly Inventory Movement</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"><i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i></a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"><a class="dropdown-item" href="#">View Details</a></div>
                    </div>
                </div>
                <div class="card-body">
                    <h6 class="text-muted mb-3">In (Receive) vs. Out (Sales) - Chart Placeholder</h6>
                    <div class="chart-bar">
                        <div style="position: relative; height: 250px; width: 100%; background-color: #f5f5f5; border: 1px dashed #ccc; display: flex; justify-content: center; align-items: center;">
                             <p class="text-muted">CHART PLACEHOLDER: Inventory Movement (Bar Chart)</p>
                        </div>
                    </div>
                </div>
            </div>

            {{-- 4. Top Selling Products (Depo Level) --}}
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Top 5 Products (Sales Volume)</h6>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-sm">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Units Sold</th>
                                <th>Value</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr><td>Product A (1Kg)</td><td>1,200</td><td>৳ 500,000</td></tr>
                            <tr><td>Product B (500g)</td><td>950</td><td>৳ 350,000</td></tr>
                            <tr><td>Product C (2Kg)</td><td>600</td><td>৳ 450,000</td></tr>
                            <tr><td>Product D (Jar)</td><td>480</td><td>৳ 280,000</td></tr>
                            <tr><td>Product E (Small)</td><td>350</td><td>৳ 150,000</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

       {{-- Right Column (4/12) --}}
        <div class="col-xl-4 col-lg-5">
            
            {{-- 3. Distributor Performance (Static Data) --}}
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Distributor Sales Share</h6>
                </div>
                <div class="card-body text-center">
                    <div style="height: 150px; background-color: #f5f5f5; border: 1px dashed #ccc; display: flex; justify-content: center; align-items: center;">
                        <p class="text-muted">CHART PLACEHOLDER: Pie Chart</p>
                    </div>
                    <ul class="list-group list-group-flush mt-3 small">
                        <li class="list-group-item d-flex justify-content-between">Distributor 1: 40%</li>
                        <li class="list-group-item d-flex justify-content-between">Distributor 2: 30%</li>
                        <li class="list-group-item d-flex justify-content-between">Others: 30%</li>
                    </ul>
                </div>
            </div>
            
            {{-- 5. Alerts (Static Data) --}}
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-danger">Depo Alerts</h6>
                </div>
                <div class="card-body">
                    <div class="alert alert-dark p-2 mb-2" role="alert">
                        <h6 class="alert-heading small fw-bold">Low Stock!</h6>
                        <p class="mb-0 small">Product B (500g) quantity below safety level.</p>
                    </div>
                    <div class="alert alert-light p-2 mb-2" role="alert">
                        <h6 class="alert-heading small fw-bold">Distributor A/R Warning!</h6>
                        <p class="mb-0 small">Distributor 2 has exceeded credit limit.</p>
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