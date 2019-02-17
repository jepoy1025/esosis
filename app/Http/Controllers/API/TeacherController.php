<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Teacher;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Collection\Paginate;

class TeacherController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function actTeacher(){
        $data = DB::table('teachers')
            ->get();
            
        return compact('data');
    }

    public function index()
    {
        return Teacher::latest()->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
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
            'name' => 'required|string|max:50|unique:teachers',
            'educational_attainment' => 'required|string|max:191',
            'civil_service' => 'required|string|max:191',
            'marital_status' => 'required|string',
        ]);

        return Teacher::create([
            'name' => $request['name'],
            'educational_attainment' => $request['educational_attainment'],
            'civil_service' => $request['civil_service'],
            'marital_status' => $request['marital_status'],
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
        $teacher = Teacher::findOrFail($id);
        $this->validate($request,[
            'name' => 'required|string|max:50|unique:teachers,name,'.$teacher->id,
            'educational_attainment' => 'required|string|max:191',
            'civil_service' => 'required|string|max:191',
            'marital_status' => 'required|string'
        ]);
        $teacher->update([
            'name' => $request['name'],
            'educational_attainment' => $request['educational_attainment'],
            'civil_service' => $request['civil_service'],
            'marital_status' => $request['marital_status']
        ]);
        return $teacher;    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $teacher = Teacher::findOrFail($id);
        $teacher -> update([
            'status' => "inactive"
        ]);
        return ['message' => 'teacher deactivated'];
    }
    public function activate($id)
    {
        $teacher = Teacher::findOrFail($id);
        $teacher -> update([
            'status' => "active"
        ]);
        return ['message' => 'teacher deactivated'];
    }
}
