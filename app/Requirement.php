<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Requirement extends Model
{
     protected $fillable = [
     	'student_id',
    	'form_137',
        'birth+_cert',
        'photo2x2'
    ];
}
