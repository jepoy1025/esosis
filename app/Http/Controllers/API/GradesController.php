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

    public function rank(request $request,$id){
        $total = 0;
        $data = DB::table('grades')
            ->where('grades.student_id', $id)
            ->get();
        $count = count($data);
        for($ctr = 0;$ctr < $count;$ctr++){
            $total = $total + $data[$ctr]->first;
            $total = $total + $data[$ctr]->second;
            $total = $total + $data[$ctr]->third;
            $total = $total + $data[$ctr]->fourth;
        }

        $count = $count * 4;
        $average = $total/$count;

        DB::table('rankings')
            ->where('student_id', $id)
            ->update(['average' => $average]);

        return $average;
    }
}
