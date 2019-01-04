<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    protected $fillable = [
        'name',
        'educational_attainment',
        'civil_service',
        'marital_status',
        'status'
    ];

}
