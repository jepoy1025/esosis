<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Room;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Collection\Paginate;

class RoomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = DB::table('rooms')
                    ->join('levels','rooms.grade_level','=','levels.id')
                    ->join('teachers','rooms.advicer_id','=','teachers.id')
                    ->where('rooms.status','active')
                    ->select('rooms.*','levels.title','teachers.name')
                    ->get();
        return compact('data');
    }

    public function inActive(){
        $data = DB::table('rooms')
                    ->join('levels','rooms.grade_level','=','levels.id')
                    ->join('teachers','rooms.advicer_id','=','teachers.id')
                    ->where('rooms.status','inactive')
                    ->select('rooms.*','levels.title','teachers.name')
                    ->get();
        return compact('data');
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
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'section' => 'required|string|max:50|unique:rooms'
        ]);

        return Room::create([
            'grade_level' => $request['grade_level'],
            'section' => $request['section'],
            'advicer_id' => $request['advicer_id'],
            'population' => 0,
            'availability' => 0, 
            'status' => "active"
        ]);
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
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $room = Room::findOrFail($id);
        $room->update([
            'grade_level' => $request['grade_level'],
            'section' => $request['section'],
            'advicer_id' => $request['advicer_id']
        ]);
        return $room;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $teacher = Room::findOrFail($id);
        $teacher -> update([
            'status' => "inactive"
        ]);
        return ['message' => 'room deactivated'];
    }
    public function activate($id)
    {
        $teacher = Room::findOrFail($id);
        $teacher -> update([
            'status' => "active"
        ]);
        return ['message' => 'teacher deactivated'];
    }
}
