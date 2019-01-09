<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Subject;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Collection\Paginate;

class SubjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function deleted(){
        $data = DB::table('subjects')
                    ->join('levels','subjects.level','=','levels.id')
                    ->join('teachers','subjects.teacher_id','=','teachers.id')
                    ->where('subjects.status','inactive')
                    ->select('subjects.*','teachers.name','levels.title AS grade_level')
                    ->get();
        return compact('data');
    }
    public function index()
    {
        $data = DB::table('subjects')
            ->join('teachers','subjects.teacher_id','=','teachers.id')
            ->join('levels','subjects.level','=','levels.id')
            ->select('subjects.*','teachers.name','levels.title AS grade_level')
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
        $subject = Subject::create([
            'title' => $request['title'],
            'teacher_id' => $request['teacher_id'],
            'level' => $request['level'],
            'duration' => $request['duration'],
            'status' => 'active'
        ]);
        return $subject;
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
        $subject = Subject::findOrFail($id);
        $subject->update([
            'title' => $request['title'],
            'teacher_id' => $request['teacher_id'],
            'level' => $request['level'],
            'duration' => $request['duration']
        ]);
        return $subject;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $subject = Subject::findOrFail($id);
        $subject -> update([
            'status' => "inactive"
        ]);
        return ['message' => 'teacher deactivated'];
    }

    public function activate($id){
        $subject = Subject::findOrFail($id);
        $subject -> update([
            'status' => "active"
        ]);
        return ['message' => 'teacher deactivated'];
    }
}
