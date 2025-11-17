<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductReceive extends Model
{
    use HasFactory;

    protected $fillable = [
        'receive_no',
        'receive_date',
        'note',
        'total_received_qty',
        'received_by_user_id',
    ];

    // Relation with User (receiver)
    public function receiver()
    {
        return $this->belongsTo(User::class, 'received_by_user_id');
    }

    // Relation with items
    public function items()
    {
        return $this->hasMany(ProductReceiveItem::class);
    }
}
