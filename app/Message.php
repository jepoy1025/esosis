<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    public function user(){
    	protected $fillable = ['message'];

    	return $this->belongsTo(User::class);
    }
}
