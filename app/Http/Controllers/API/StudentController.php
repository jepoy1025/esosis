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
    public function sponsorGet($id){
        $data = DB::table('sponsor_students')
            ->join('students','sponsor_students.student_id','=','students.id')
            ->join('levels','students.grade_level_id','=','levels.id')
            ->where('sponsor_students.sponsor_id',$id)
            ->select('students.*','levels.title')
            ->get();
        return compact('data');
    }

    public function parentGet($id){
        $data = DB::table('parent_student')
            ->join('students','parent_student.student_id','=','students.id')
            ->join('levels','students.grade_level_id','=','levels.id')
            ->where('parent_student.parent_id',$id)
            ->select('students.*','levels.title')
            ->get();

        return compact('data');
    }
    public function waitingList(){
        //$ret = "sasdasd";
        $data = DB::table('students')
                    ->join('levels','students.grade_level_id','=','levels.id')
                    ->where('status','=','2')
                    ->select('students.*','levels.title')
                    ->get();
        return compact('data');
    }
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
        $this->validate($request,[
            'first_name' => 'required|string|max:50',
            'middle_name' => 'required|string|max:50',
            'last_name' => 'required|string|max:50',
            'address' => 'required|string|max:50',
            'gender' => 'required|string',
            'birth_date' => 'required|string|max:50',
            'room_id' => 'required',
            'student_code' => 'required',
        ]);


        $sy = DB::table('school_year')
        ->orderBy('id','DESC')
        ->first();
        $count1 = DB::table('students')->where('status','=','1')->count();
        $count2 = DB::table('students')->where('status','=','3')->count();
        $student_id = $sy->school_year.($count1+$count2+1);
        $room = DB::table('rooms')
        ->where('grade_level','=',$request['room_id'])
        ->where('availability','=',0)
        ->first();

        //insert student info
        $students = Student::create([
          'student_id' => $student_id,
          'first_name' => $request['first_name'],
          'middle_name' => $request['middle_name'],
          'last_name' => $request['last_name'],
          'lecture_id' => $request['room_id'],
          'grade_level_id' => $request['grade_level'],
          'address' => $request['address'],
          'gender' => $request['gender'],
          'birth_date' => $request['birth_date'],
          'status' => $request['student_type'],
        ]);

        //get ID
        $student = DB::table('students')
          ->where('student_id','=',$student_id)
          ->first();
        $id = $student->id;

        //siblings input
        if ($request['noOfSisters'] > 0) {
            for ($ctr = 1; $ctr < $request->get('noOfSisters')+1; $ctr++) {
                DB::table('siblings')->insert(
                    [
                        'student_id' => $id,
                        'type' => 'sister',
                        'name' => $request->get('sistersName')[$ctr],
                        'birth_date' => $request->get('sistersDob')[$ctr],
                    ]
                );
            }
        }
        if ($request['noOfBrothers'] > 0) {
            for ($ctr = 1; $ctr < $request->get('noOfBrothers')+1; $ctr++) {
                DB::table('siblings')->insert(
                    [
                        'student_id' => $id,
                        'type' => 'brother',
                        'name' => $request->get('brothersName')[$ctr],
                        'birth_date' => $request->get('brothersDob')[$ctr],
                    ]
                );
            }
        }
        //parental Insert
        if($request['guardianCheck'] == true){
            DB::table('parents')->insert(
            array(
                   'student_id'     =>   $id, 
                   'type'   =>   'guardian',
                   'name'   =>  $request['guardiansName'],
                   'occupation' => $request['guardiansSourceIncome'],
                   'company' => $request['guardiansCompany'],
                   'monthly_income' => $request['guardiansMonthlyIncome'],
            )
          );
        }else{
            DB::table('parents')->insert(
            array(
                   'student_id'     =>   $id, 
                   'type'   =>   'father',
                   'name'   =>  $request['fathersName'],
                   'occupation' => $request['fathersSourceIncome'],
                   'company' => $request['fathersCompany'],
                   'monthly_income' => $request['fathersMonthlyIncome'],
            )
          );
            DB::table('parents')->insert(
            array(
                   'student_id'     =>   $id, 
                   'type'   =>   'mother',
                   'name'   =>  $request['mothersName'],
                   'occupation' => $request['mothersSourceIncome'],
                   'company' => $request['mothersCompany'],
                   'monthly_income' => $request['mothersMonthlyIncome'],
            )
          );
        }
    //emergency insert
        DB::table('emergencies')->insert(
      array(
             'student_id'     =>   $id, 
             'name'   =>   $request['emergencyName'],
             'relationship'   =>  $request['emergencyRelationship'],
             'contact' => $request['emergencyContact'],
             'address' => $request['emergencyAddress'],
             'alt_contact' => $request['emergencyAltContact'],
      )
      );

    //past school info insert
        if($request['grade_level'] > 3){
            DB::table('past_schools')->insert(
      array(
             'student_id'     =>   $id, 
             'pastSchool'   =>   $request['schoolAttended'],
             'schoolAddress'   =>  $request['schoolAttendedAddress'],
             'date' => $request['schoolAttendedDate'],
      )
      );
        }
    //increment population
    $room = DB::table('rooms')
    ->where('id','=',$request['room_id'])
    ->first();

    $population = $room->population;

    $population++;

    DB::table('rooms')
        ->where('id', $room->id)
        ->update(['population' => $population]);
    
    //insert requirements
        if($request['grade_level'] > 4){
            DB::table('requirements')->insert(
      array(
             'student_id'     =>   $id, 
             'form_137'   =>   $request['form137'],
             'birth_cert'   =>  $request['nso'],
             'photo2x2' => $request['picture1x1'],
      )
      );
        }else{
            DB::table('requirements')->insert(
      array(
             'student_id'     =>   $id, 
             'form_137'   =>   true,
             'birth_cert'   =>  $request['nso'],
             'photo2x2' => $request['picture1x1'],
      )
      );
        }

    //payments
    $amount = $request['paidAmount'];
    $tuition = $request['whole_year'];
    $misc = $request['misc'];
    $uniform = $request['uniform'];
    if($request['uniformCheck'] == false){
        $uniform = 0;
    }
    if($amount > 500){
        $tuition = $tuition - 500;
        $amount = $amount - 500;
        $misc = $misc - $amount;
    }else{
        $tuition = $request['whole_year'] - $amount;
    }

    DB::table('payments')->insert(
      array(
             'student_id'     =>   $id, 
             'past_balance'   =>   0,
             'whole_year'   =>  $tuition,
             'misc' => $misc,
             'books' => $request['books'],
             'uniform' => $uniform,
             'req_tuition' => 500,
             'bal_tuition' => 0,
      )
      );

    DB::table('level_student')->insert(
      array(
             'student_id'     =>   $id, 
             'level_id'   =>   $request['grade_level'],
      )
      );

    DB::table('comments')->insert(
      array(
             'student_id'     =>   $id, 
             'grade_level'   =>   $request['grade_level'],
             'first'    => 'Please Fill',
             'second'    => 'Please Fill',
             'third'    => 'Please Fill',
             'fourth'    => 'Please Fill',
      )
      );
    $countSubj = DB::table('subjects')->where('level','=',$request['grade_level'])->count();
    //$subject = DB::table('subjects')->where('level','=',$request['grade_level'])->get();
    $subject = DB::table('subjects')->where([
        ['level', '=', $request['grade_level']],
        ['status', '=', 'active'],
    ])->get();

    foreach ($subject as $subject) {
        DB::table('grades')->insert(
      array(
             'student_id'     =>   $id, 
             'subject_id'   =>   $subject->id,
             'grade_level'   =>   $request['grade_level'],
             'first'    => 0,
             'second'    => 0,
             'third'    => 0,
             'fourth'    => 0,
      )
      );
    }

    DB::table('codes')->insert(
        array(
            'code' => $request['student_code'],
            'student_id' => $id,
        )
    );

    DB::table('transactions')->insert(
        array(
            'student_id'     =>   $id, 
            'type' => 'Enrollment',
            'amount' => $request['paidAmount'],
        )
    );
    $data = $id;
            return compact('data');
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function enrollWaiting(Request $request){

    }

    public function show($id)
    {
        $data = DB::table('students')
            ->where('id', $id)
            ->first();

         return compact('data');
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
