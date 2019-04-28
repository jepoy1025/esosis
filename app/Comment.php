<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $fillable = [
    	'student_id',
        'first',
        'second',
        'third',
        'fourth',
        'sy_id'
    ];
}
