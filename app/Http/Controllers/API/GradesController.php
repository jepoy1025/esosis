<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB; 
use App\Grade;

class GradesController extends Controller
{
    public function index()
    {
         $data = DB::table('students')
            ->join('levels','students.grade_level_id','=','levels.id')
            ->join('payments','students.id','=','payments.student_id')
         	->where('students.status','=','1')
            ->orWhere('students.status','=','2')
            ->select('students.*','levels.title','payments.past_balance','payments.enrollment_fee','payments.whole_year','payments.misc','payments.books','payments.uniform','payments.pta')
         	->get();

         return compact('data'); 
         	
    }

    public function gradeList(Request $request, $id){
        $student = DB::table('students')->where('id',$id)->first();
    	 $data = DB::table('grades')
    	 	->join('subjects','grades.subject_id','=','subjects.id')
         	->where([
                ['grades.student_id', '=', $id],
                ['grades.grade_level', '=', $student->grade_level_id],

            ])
         	->select('grades.*','subjects.title')
         	->get();

         return compact('data'); 
    }

    public function update(Request $request, $id){
    	$subject = Grade::findOrFail($id);
    	$subject->update([
            'first' => $request['first'],
            'second' => $request['second'],
            'third' => $request['third'],
            'fourth' => $request['fourth']
        ]);
        return $subject; 
    }

    public function print($id){
        $student = DB::table('students')
            ->join('levels','students.grade_level_id','levels.id')
            ->join('rooms','students.lecture_id','rooms.id')
            ->join('teachers','rooms.advicer_id','teachers.id')
            ->where('students.id', $id)
            ->select('students.*','levels.title','rooms.section','teachers.name')
            ->first();
        //dd($student);
        $data = DB::table('grades')
            ->join('subjects','grades.subject_id','=','subjects.id')
            ->where([
                ['grades.student_id','=', $id],
                ['grades.grade_level','=', $student->grade_level_id]
                    ])
            ->select('grades.*','subjects.title')
            ->get();
        $comments = DB::table('comments')
            ->where([
                ['comments.student_id','=', $id],
                ['comments.grade_level','=', $student->grade_level_id]
                    ])
            ->first();
           //dd($comments);
        return view('prints.grades', ['data' => $data, 'comments' => $comments, 'student' => $student]);
    }

    public function printAll($id){
        $student = DB::table('students')
            ->join('levels','students.grade_level_id','levels.id')
            ->join('rooms','students.lecture_id','rooms.id')
            ->join('teachers','rooms.advicer_id','teachers.id')
            ->where('students.id', $id)
            ->select('students.*','levels.title','rooms.section','teachers.name')
            ->first();
        $grades = DB::table('grades')
            ->join('subjects','grades.subject_id','=','subjects.id')
            ->where('grades.student_id','=', $id)
            ->select('grades.*','subjects.title')
            ->get();
        $gradeLevels = DB::table('level_student')
            ->join('levels','level_student.level_id','levels.id')
            ->where('level_student.student_id', $id)
            ->orderBy('level_student.level_id', 'asc')
            ->get();
        //dd($data);
        return view('prints.gradesAll', ['grades' => $grades, 'gradeLevels'=>$gradeLevels, 'student' => $student]);
    }

    public function rank(request $request,$id){
        $total1 = 0;
        $total2 = 0;
        $total3 = 0;
        $total4 = 0;
        $proceed = 1;
        $student = DB::table('students')
                   ->where('id', $id)
                   ->first();
        $data = DB::table('grades')
            ->where([
                    ['grades.student_id','=',$id],
                    ['grade_level','=',$student->grade_level_id]
                 ])
            ->get();
        $count = count($data);
        for($ctr = 0;$ctr < $count;$ctr++){
            if($proceed == 1){
                $total1 = $total1 + $data[$ctr]->first;
                if($data[$ctr]->first == 0){
                    $proceed = 0;
                }
                $total2 = $total2 + $data[$ctr]->second;
                if ($data[$ctr]->second == 0) {
                    $proceed = 0;
                }
                $total3 = $total3 + $data[$ctr]->third;
                if ($data[$ctr]->third == 0) {
                    $proceed = 0;
                }
                $total4 = $total4 + $data[$ctr]->fourth;
                if ($data[$ctr]->fourth == 0) {
                    $proceed = 0;
                }
            }else{
                $total1 = $total1 + $data[$ctr]->first;
                $total2 = $total2 + $data[$ctr]->second;
                $total3 = $total3 + $data[$ctr]->third;
                $total4 = $total4 + $data[$ctr]->fourth;
            }
        }

        // for($ctr2 = 0;$ctr2 < $count;$ctr2++){
        //     if($data[$ctr2]->first == 0){
        //         $proceed = 0;
        //         $ctr2 = $count;
        //     }
        //     if ($data[$ctr2]->second == 0) {
        //         $proceed = 0;
        //         $ctr2 = $count;
        //     }
        //     if ($data[$ctr2]->third == 0) {
        //         $proceed = 0;
        //         $ctr2 = $count;
        //     }
        //     if ($data[$ctr2]->fourth == 0) {
        //         $proceed = 0;
        //         $ctr2 = $count;
        //     }
        // }

        DB::table('students')
            ->where('id', $id)
            ->update(['proceed' => $proceed]);

        $first = $total1/$count;
        $second = $total2/$count;
        $third = $total3/$count;
        $fourth = $total4/$count;
        $count = $count * 4;
        $average = ($total1+$total2+$total3+$total4)/$count;

        DB::table('rankings')
            ->where('student_id', $id)
            ->update(['average' => $average]);
        DB::table('first_rankings')
            ->where('student_id', $id)
            ->update(['average' => $first]);
        DB::table('second_rankings')
            ->where('student_id', $id)
            ->update(['average' => $second]);
        DB::table('third_rankings')
            ->where('student_id', $id)
            ->update(['average' => $third]);
        DB::table('fourth_rankings')
            ->where('student_id', $id)
            ->update(['average' => $fourth]);

        return $average;
    }
}
