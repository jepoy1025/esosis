<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable = [
     	'student_id',
    	'past_balance',
        'whole_year',
        'misc',
        'books',
        'uniform',
    ];
}
