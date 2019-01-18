<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $fillable = [
        'student_id',
        'photo',
        'first_name',
        'middle_name',
        'last_name',
        'lecture_id',
        'grade_level_id',
        'address',
        'gender',
        'birth_date',
        'status',
    ];
}
