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

    protected $appends = [
        'grade_level'
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'teacher_id');
    }

    /**
     * @return mixed|null
     */
    public function getGradeLevelAttribute()
    {
        $level = Level::query()->find($this->level);
        if (!$level) {
            return null;
        }
        return $level->title;
    }
}
