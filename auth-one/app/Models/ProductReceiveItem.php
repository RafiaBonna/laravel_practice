<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductReceiveItem extends Model
{
    use HasFactory;

    protected $table = 'product_receive_items';

    protected $fillable = [
        'product_receive_id',
        'product_id',
        'batch_no',
        'production_date',
        'expiry_date',
        'received_quantity',
        'cost_rate',
        'mrp',
        'retail',
        'distributor',
        'depo_selling',
        'total_item_cost',
    ];

    public function receive()
    {
        return $this->belongsTo(ProductReceive::class, 'product_receive_id');
    }

    public function product()
    {
        return $this->belongsTo(\App\Models\Product::class, 'product_id');
    }
}
