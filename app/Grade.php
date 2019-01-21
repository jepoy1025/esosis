<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Grade extends Model
{
    protected $fillable = [
    	'student_id',
        'subject_id',
        'first',
        'second',
        'third',
        'fourth'
    ];
}
