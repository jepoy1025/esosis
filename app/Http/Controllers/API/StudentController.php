<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Student;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Collection\Paginate;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    // public function getCount(){
    //     $data = DB::table('students')
    //                 ->join('levels','rooms.grade_level','=','levels.id')
    //                 ->join('teachers','rooms.advicer_id','=','teachers.id')
    //                 ->where('rooms.status','active')
    //                 ->select('rooms.*','levels.title','teachers.name')
    //                 ->get();

    // }


    public function index()
    {
        //
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
        $returns = $request->all();
        // $this->validate($request,[
        //     'first_name' => 'required|string|max:50',
        //     'middle_name' => 'required|string|max:50',
        //     'last_name' => 'required|string|max:50',
        //     'address' => 'required|string|max:50',
        //     'gender' => 'required|string',
        //     'birth_date' => 'required|string|max:50',
        // ]);


        // $sy = DB::table('school_year')
        // ->orderBy('id','DESC')
        // ->first();
        // $count1 = DB::table('students')->where('status','=','1')->count();
        // $count2 = DB::table('students')->where('status','=','3')->count();
        // $student_id = $sy->school_year.($count1+$count2+1);
        // $room = DB::table('rooms')
        // ->where('grade_level','=',$request['room_id'])
        // ->where('availability','=',0)
        // ->first();

        // $students = Student::create([
        //   'student_id' => $student_id,
        //   'first_name' => $request['first_name'],
        //   'middle_name' => $request['middle_name'],
        //   'last_name' => $request['last_name'],
        //   'lecture_id' => $request['room_id'],
        //   'address' => $request['address'],
        //   'gender' => $request['gender'],
        //   'birth_date' => $request['birth_date'],
        //   'status' => $request['student_type'],
        // ]);
        // $student = DB::table('students')
        //   ->where('student_id','=',$student_id)
        //   ->first();
        // $id = $student->id;
        
        // if($request['noOfSister'] > 0){
            
        // }
        // if($request['noOfBrothers'] > 0){
        //     for($ctr = 1; $ctr < $request['noOfBrothers']+1; $ctr++){
        //         DB::table('siblings')->insert(
        //         array(
        //                'student_id'     =>   $id, 
        //                'type'   =>   'brother',
        //                'name'   =>  $request->[{'brothersName['.$ctr.']'}],
        //                'birth_date' => $request->[{'brothersDob['.$ctr.']'}],
        //         )
        //         );
        //     }
        // }
        

        return compact('returns');

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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
