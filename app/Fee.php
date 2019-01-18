<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Fee extends Model
{
    protected $fillable = [
        'grade_level',
        'whole_year',
        'misc',
        'books',
        'uniform',
        'min_downpayment'
    ];
}
