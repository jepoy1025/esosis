<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    public function user()
    {
        $fillable = ['message'];
        return $this->belongsTo(User::class);
    }
}
