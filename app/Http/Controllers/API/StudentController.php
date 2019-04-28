<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Student;
use App\Transaction;
use App\Grade;
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
    public function checkname(Request $request){
        $data = false;
        $first = DB::table('students')
            ->where('first_name',strtolower($request['first_name']))
            ->first();
        $middle = DB::table('students')
            ->where('middle_name',strtolower($request['middle_name']))
            ->first();
        $last = DB::table('students')
            ->where('last_name',strtolower($request['last_name']))
            ->first();

        if($first != null){
            if($middle != null){
                if($last != null)
                    $data = true;
            }
        }
        return compact('data');
    }
    public function transferEnroll(Request $request, $id){
        $sy = DB::table('school_year')
        ->orderBy('id','DESC')
        ->first();

        $gradeID = DB::table('levels')
                ->where('id',$request->grade_level)
                ->first();
        //dd($gradeID);
        $paid = $request['paidAmount'];
        $count1 = DB::table('students')->where('sy_id','=',$sy->id)->count();
        $student_id = $sy->school_year.($count1+1);
        $student = DB::table('students')
                ->where('id', $id)
                ->first();
        //$level_id = $student->grade_level_id + 1;
        $fees = DB::table('fees')->where('grade_level',$gradeID->id)->first();
        $uniform = $fees->uniform;
        if($request['uniformCheck'] == false){
            $uniform = 0;
        }
        $minDP = $fees->min_downpayment - $paid;
        $balance = DB::table('payments')->where('student_id','=',$id)->first();
        //dd($balance);
        $totalBalance = $balance->whole_year + $balance->uniform + $balance->misc + $balance->books + $balance->past_balance;
        $updatePayments = DB::table('payments')
                        ->where('student_id','=',$id)
                        ->update([
                            'enrollment_fee' => $minDP,
                            'past_balance' => $totalBalance,
                            'whole_year' => $fees->whole_year,
                            'misc' => $fees->misc,
                            'books' => $fees->books,
                            'uniform' => $uniform,    
                        ]);
        transaction::create([
            'student_id' => $id,
            'type' => 'Enrollment Fee',
            'amount' => $request['paidAmount'],
        ]);

        $countSubj = DB::table('subjects')->where('level','=',$gradeID->id)->count();
        $subject = DB::table('subjects')->where([
            ['level', '=', $gradeID->id],
            ['status', '=', 'active'],
        ])->get();
        foreach ($subject as $subject) {
        DB::table('grades')->insert(
          array(
                 'student_id'     =>   $id, 
                 'subject_id'   =>   $subject->id,
                 'grade_level'   =>   $gradeID->id,
                 'first'    => 0,
                 'second'    => 0,
                 'third'    => 0,
                 'fourth'    => 0,
                 'sy_id' => $sy->id,
          )
          );
        }

        DB::table('comments')->insert(
          array(
                 'student_id'     =>   $id, 
                 'grade_level'   =>   $gradeID->id,
                 'first'    => 'Please Fill',
                 'second'    => 'Please Fill',
                 'third'    => 'Please Fill',
                 'fourth'    => 'Please Fill',
                 'sy_id' => $sy->id,
          )
          );

        DB::table('level_student')->insert(
          array(
                 'student_id'     =>   $id, 
                 'level_id'   =>   $gradeID->id,
                 'sy_id' => $sy->id,
          )
          );

        $lecture_id = DB::table('rooms')
                    ->where([
                        ['grade_level', '=', $gradeID->id],
                        ['availability', '=', 0]
                    ])
                    ->first();

        $update = DB::table('students')
            ->where('id', $id)
            ->update([
                'student_id' => $student_id,
                'grade_level_id' => $gradeID->id,
                'lecture_id' => $lecture_id->id,
                'sy_id' => $sy->id,
                'status' => 1,
                'proceed' => 0,
        ]);
        DB::table('rankings')
            ->where('student_id', $id)
            ->update([
                'grade_level' => $gradeID->id,
                'average' => 00.00
            ]);
        DB::table('first_rankings')
            ->where('student_id', $id)
            ->update([
                'grade_level' => $gradeID->id,
                'average' => 00.00
            ]);
        DB::table('second_rankings')
            ->where('student_id', $id)
            ->update([
                'grade_level' => $gradeID->id,
                'average' => 00.00
            ]);
        DB::table('third_rankings')
            ->where('student_id', $id)
            ->update([
                'grade_level' => $gradeID->id,
                'average' => 00.00
            ]);
        DB::table('fourth_rankings')
            ->where('student_id', $id)
            ->update([
                'grade_level' => $gradeID->id,
                'average' => 00.00
            ]);


        return compact('update');


    }
    public function pending(){
        $data = DB::table('students')
                    ->join('levels','students.grade_level_id','=','levels.id')
                    ->where([
                        ['students.proceed','=','0'],
                        ['students.status','=','1']
                    ])
                    ->select('students.*','levels.title')
                    ->get();
        return compact('data');
    }
    public function studentProfile($id){
        $data = DB::table('students')
            ->join('levels','students.grade_level_id','=','levels.id')
            ->where('students.id',$id)
            ->select('students.*','levels.title')
            ->first();
        return compact('data');
    }
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
        $sy = DB::table('school_year')
        ->orderBy('id','DESC')
        ->first();
        $data = DB::table('students')
                    ->join('levels','students.grade_level_id','=','levels.id')
                    ->where('sy_id','!=',$sy->id)
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
            'address' => 'required|string|max:100',
            'gender' => 'required|string',
            'birth_date' => 'required|string|max:50',
            'room_id' => 'required',
            'student_code' => 'required',
        ]);


        $sy = DB::table('school_year')
        ->orderBy('id','DESC')
        ->first();
        $dateYear = date('Y');
        $count1 = DB::table('students')->where('sy_id','=',$sy->id)->count();
        $student_id = $dateYear.($count1+1);
        $room = DB::table('rooms')
        ->where('grade_level','=',$request['room_id'])
        ->where('availability','=',0)
        ->first();

        //insert student info
        $students = Student::create([
          'student_id' => $student_id,
          'first_name' => strtolower($request['first_name']),
          'middle_name' => strtolower($request['middle_name']),
          'last_name' => strtolower($request['last_name']),
          'lecture_id' => $request['room_id'],
          'grade_level_id' => $request['grade_level'],
          'address' => $request['address'],
          'gender' => $request['gender'],
          'birth_date' => $request['birth_date'],
          'sy_id' => $sy->id,
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
    $minDP = $request['min_downpayment'];
    $misc = $request['misc'];
    $uniform = $request['uniform'];
    if($request['uniformCheck'] == false){
        $uniform = 0;
    }
    $minDP = $minDP - $amount;

    DB::table('payments')->insert(
      array(
             'student_id'     =>   $id,
             'enrollment_fee' =>   $minDP,
             'past_balance'   =>   0,
             'whole_year'   =>  $request['whole_year'],
             'misc' => $misc,
             'books' => $request['books'],
             'uniform' => $uniform,
             'pta' => $request['pta'],
             'req_tuition' => 500,
             'bal_tuition' => 0,
      )
      );

    DB::table('level_student')->insert(
      array(
             'student_id'     =>   $id, 
             'level_id'   =>   $request['grade_level'],
             'sy_id' => $sy->id,
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
             'sy_id' => $sy->id,
      )
      );
    $countSubj = DB::table('subjects')->where([['level','=',$request['grade_level']],['status', '=', 'active']])->count();
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
             'sy_id' => $sy->id,
      )
      );
    }

    DB::table('codes')->insert(
        array(
            'code' => $request['student_code'],
            'student_id' => $id,
        )
    );

    transaction::create([
            'student_id' => $id,
            'type' => 'Enrollment Fee',
            'amount' => $request['paidAmount'],
        ]);


    DB::table('rankings')->insert(
        array(
            'grade_level' => $request['grade_level'],
            'student_id'     =>   $id, 
            'average' => 00.00
        )
    );
    DB::table('first_rankings')->insert(
        array(
            'grade_level' => $request['grade_level'],
            'student_id'     =>   $id, 
            'average' => 00.00
        )
    );
    DB::table('second_rankings')->insert(
        array(
            'grade_level' => $request['grade_level'],
            'student_id'     =>   $id, 
            'average' => 00.00
        )
    );
    DB::table('third_rankings')->insert(
        array(
            'grade_level' => $request['grade_level'],
            'student_id'     =>   $id, 
            'average' => 00.00
        )
    );
    DB::table('fourth_rankings')->insert(
        array(
            'grade_level' => $request['grade_level'],
            'student_id'     =>   $id, 
            'average' => 00.00
        )
    );
    $data = $id;
            return compact('data');
        
    }

    public function oldStudent(Request $request, $id){
        //Student ID
        $sy = DB::table('school_year')
        ->orderBy('id','DESC')
        ->first();
        //Amount
        $paid = $request['paidAmount'];
        $count1 = DB::table('students')->where('sy_id','=',$sy->id)->count();
        $student_id = $sy->school_year.($count1+1);
        $student = DB::table('students')
                ->where('id', $id)
                ->first();
        $level_id = $student->grade_level_id + 1;
        $fees = DB::table('fees')->where('grade_level',$level_id)->first();
        $uniform = $fees->uniform;
        if($request['uniformCheck'] == false){
            $uniform = 0;
        }
        $minDP = $fees->min_downpayment - $paid;
        $balance = DB::table('payments')->where('student_id','=',$id)->first();
        //dd($balance);
        $totalBalance = $balance->whole_year + $balance->uniform + $balance->misc + $balance->books + $balance->past_balance;
        $updatePayments = DB::table('payments')
                        ->where('student_id','=',$id)
                        ->update([
                            'enrollment_fee' => $minDP,
                            'past_balance' => $totalBalance,
                            'whole_year' => $fees->whole_year,
                            'misc' => $fees->misc,
                            'books' => $fees->books,
                            'uniform' => $uniform,    
                        ]);
        transaction::create([
            'student_id' => $id,
            'type' => 'Enrollment Fee',
            'amount' => $request['paidAmount'],
        ]);


        //Load Subject
        $countSubj = DB::table('subjects')->where('level','=',$level_id)->count();
        $subject = DB::table('subjects')->where([
            ['level', '=', $level_id],
            ['status', '=', 'active'],
        ])->get();
        foreach ($subject as $subject) {
        DB::table('grades')->insert(
          array(
                 'student_id'     =>   $id, 
                 'subject_id'   =>   $subject->id,
                 'grade_level'   =>   $level_id,
                 'first'    => 0,
                 'second'    => 0,
                 'third'    => 0,
                 'fourth'    => 0,
                 'sy_id' => $sy->id,
          )
          );
        }

        DB::table('comments')->insert(
          array(
                 'student_id'     =>   $id, 
                 'grade_level'   =>   $level_id,
                 'first'    => 'Please Fill',
                 'second'    => 'Please Fill',
                 'third'    => 'Please Fill',
                 'fourth'    => 'Please Fill',
                 'sy_id' => $sy->id,
          )
          );

        DB::table('level_student')->insert(
          array(
                 'student_id'     =>   $id, 
                 'level_id'   =>   $level_id,
                 'sy_id' => $sy->id,
          )
          );

        $lecture_id = DB::table('rooms')
                    ->where([
                        ['grade_level', '=', $level_id],
                        ['availability', '=', 0]
                    ])
                    ->first();

        $update = DB::table('students')
            ->where('id', $id)
            ->update([
                'student_id' => $student_id,
                'grade_level_id' => $level_id,
                'lecture_id' => $lecture_id->id,
                'sy_id' => $sy->id,
                'status' => 1,
                'proceed' => 0,
        ]);
        DB::table('rankings')
            ->where('student_id', $id)
            ->update([
                'grade_level' => $level_id,
                'average' => 00.00
            ]);
        DB::table('first_rankings')
            ->where('student_id', $id)
            ->update([
                'grade_level' => $level_id,
                'average' => 00.00
            ]);
        DB::table('second_rankings')
            ->where('student_id', $id)
            ->update([
                'grade_level' => $level_id,
                'average' => 00.00
            ]);
        DB::table('third_rankings')
            ->where('student_id', $id)
            ->update([
                'grade_level' => $level_id,
                'average' => 00.00
            ]);
        DB::table('fourth_rankings')
            ->where('student_id', $id)
            ->update([
                'grade_level' => $level_id,
                'average' => 00.00
            ]);



        return compact('student');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function dropEnroll(Request $request, $id){
        $sy = DB::table('school_year')
        ->orderBy('id','DESC')
        ->first();
        //Amount
        $paid = $request['paidAmount'];
        $count1 = DB::table('students')->where('status','=','1')->count();
        $student_id = $sy->school_year.($count1+1);
        $student = DB::table('students')
                ->where('id', $id)
                ->first();
        $level_id = $student->grade_level_id;
        $fees = DB::table('fees')->where('grade_level',$level_id)->first();
        $uniform = $fees->uniform;
        if($request['uniformCheck'] == false){
            $uniform = 0;
        }
        $minDP = $fees->min_downpayment - $paid;
        $balance = DB::table('payments')->where('student_id','=',$id)->first();
        //dd($balance);
        $totalBalance = $balance->whole_year + $balance->uniform + $balance->misc + $balance->books + $balance->past_balance;
        $updatePayments = DB::table('payments')
                        ->where('student_id','=',$id)
                        ->update([
                            'enrollment_fee' => $minDP,
                            'past_balance' => $totalBalance,
                            'whole_year' => $fees->whole_year,
                            'misc' => $fees->misc,
                            'books' => $fees->books,
                            'uniform' => $uniform,    
                        ]);
        transaction::create([
            'student_id' => $id,
            'type' => 'Enrollment Fee',
            'amount' => $request['paidAmount'],
        ]);

        DB::table('comments')->where([
            ['student_id', $id],
            ['grade_level', $level_id]
        ])->delete(); 
        //dd('check');
        $countSubj = DB::table('subjects')->where('level','=',$level_id)->count();
        $subject = DB::table('subjects')->where([
            ['level', '=', $level_id],
            ['status', '=', 'active'],
        ])->get();
        foreach ($subject as $subject) {
        DB::table('grades')->insert(
          array(
                 'student_id'     =>   $id, 
                 'subject_id'   =>   $subject->id,
                 'grade_level'   =>   $level_id,
                 'first'    => 0,
                 'second'    => 0,
                 'third'    => 0,
                 'fourth'    => 0,
                 'sy_id' => $sy->id,
          )
          );
        }

        DB::table('comments')->insert(
          array(
                 'student_id'     =>   $id, 
                 'grade_level'   =>   $level_id,
                 'first'    => 'Please Fill',
                 'second'    => 'Please Fill',
                 'third'    => 'Please Fill',
                 'fourth'    => 'Please Fill',
                 'sy_id' => $sy->id,
          )
          );

        $lecture_id = DB::table('rooms')
                    ->where([
                        ['grade_level', '=', $level_id],
                        ['availability', '=', 0]
                    ])
                    ->first();

        $update = DB::table('students')
            ->where('id', $id)
            ->update([
                'student_id' => $student_id,
                'grade_level_id' => $level_id,
                'lecture_id' => $lecture_id->id,
                'sy_id' => $sy->id,
                'status' => 1,
            ]);

        DB::table('rankings')
            ->where('student_id', $id)
            ->update([
                'average' => 00.00
            ]);
        DB::table('first_rankings')
            ->where('student_id', $id)
            ->update([
                'average' => 00.00
            ]);
        DB::table('second_rankings')
            ->where('student_id', $id)
            ->update([
                'average' => 00.00
            ]);
        DB::table('third_rankings')
            ->where('student_id', $id)
            ->update([
                'average' => 00.00
            ]);
        DB::table('fourth_rankings')
            ->where('student_id', $id)
            ->update([
                'average' => 00.00
            ]);

        return compact('student');
    }

    public function enrollWaiting(Request $request){

    }

    public function show($id)
    {
        $data = DB::table('students')
            ->join('levels','students.grade_level_id','=','levels.id')
            ->select('students.*','levels.title')
            ->where('students.id', $id)
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

    public function archive(Request $request, $id)
    {
        return $data = DB::table('students')
            ->where('id', $id)
            ->update(['status' => 3]);
    }

    public function dropStudent(Request $request, $id)
    {
        //dd($id);
        return $data = DB::table('students')
            ->where('id', $id)
            ->update(['status' => 4]);
    }

    public function dropList(){
        $data = DB::table('students')
            ->join('levels','students.grade_level_id','levels.id')
            ->where('status', 4)
            ->select('students.*','levels.title')
            ->get();

        return compact('data');
    }

    public function transferedList(){
        $data = DB::table('students')
            ->join('levels','students.grade_level_id','levels.id')
            ->where('status', 3)
            ->select('students.*','levels.title')
            ->get();

        return compact('data');
    }

}


