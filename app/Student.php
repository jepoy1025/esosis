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
        'sy_id',
        'status',
        'proceed'
    ];

    /**
     * @return string
     */
    public function getNameAttribute()
    {
        return implode(' ', [$this->first_name, $this->middle_name, $this->last_name]);
    }
}
