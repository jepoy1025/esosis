<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\Schedule\StoreRequest;
use App\Schedule;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Schedule::query()
            ->with('subject')
            ->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreRequest $request
     * @return Schedule|\Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Eloquent\Model|\Illuminate\Http\Response
     */
    public function store(StoreRequest $request)
    {
        // return response()->json(['isvalid'=>false,'errors'=>'wweeeew']);
        // $schedule = Schedule::query()->create($request->only('subject_id', 'room_id', 'teacher_id', 'start_time', 'end_time', 'day'));
        // return $schedule;
        return Response::json(['error' => 'Error msg'], 404); // Status code here
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param Schedule $schedule
     * @return Schedule
     */
    public function update(Request $request, Schedule $schedule)
    {
        // $schedule->update($request->only('subject_id', 'room_id', 'teacher_id', 'start_time', 'end_time', 'day'));
        // return $schedule;
        return Response::json(['error' => 'Error msg'], 404);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Schedule $schedule
     * @return void
     * @throws \Exception
     */
    public function destroy(Schedule $schedule)
    {
        $schedule->delete();
    }
}
