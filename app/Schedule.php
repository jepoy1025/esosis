<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    protected $guarded = [];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function subject()
    {
        return $this->belongsTo(Subject::class);
    }

    /**
     * @return string
     */
    public function getFormattedRangeAttribute()
    {
        return Carbon::parse($this->start_time)->format('h:i a') . ' - ' . Carbon::parse($this->end_time)->format('h:i a');
    }

    /**
     * @return int
     */
    public function getDurationMinutesAttribute()
    {
        return Carbon::parse($this->end_time)->diffInMinutes(Carbon::parse($this->start_time));
    }
}
