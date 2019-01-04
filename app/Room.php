<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    protected $fillable = [
        'grade_level',
        'section',
        'advicer_id',
        'population',
        'availability',
        'status'
    ];
}
