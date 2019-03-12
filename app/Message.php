<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class message extends Model
{
    protected $fillable = [
        'subject',
        'message',
        'status',
        'user_id'
    ];
}
