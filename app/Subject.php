<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    protected $fillable = [
        'title',
        'teacher_id',
        'level',
        'duration',
        'status'
    ];
}
