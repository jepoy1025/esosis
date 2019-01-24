<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class ReportsController extends Controller
{
    public function generatePDF($id){
    	$data = DB::table('students')
    		->where([
			    ['lecture_id', '=', $id],
			    ['status', '=', 1],
			])
    		->get();
    	return view('prints.invoice', ['data' => $data]);
    }

    public function studentRoom(Request $request, $id){
    	$data = DB::table('students')
    		->where([
			    ['lecture_id', '=', $id],
			    ['status', '=', 1],
			])
    		->get();

    	return compact('data');
    }

    public function transactions($id){
        $data = DB::table('transactions')
            ->where('student_id', $id)
            ->get();

         return view('prints.transaction', ['data' => $data]);
    }

    public function studentRank($id){
        $data = DB::table('rankings')
            ->join('students', 'rankings.student_id', '=', 'students.id')
            ->where('rankings.grade_level','=',$id)
            ->select('students.*','rankings.*')
            ->orderBy('average', 'desc')
            ->take(10)
            ->get();

        return compact('data');
    }


    public function topStudents($id){
        $data = DB::table('rankings')
            ->join('students', 'rankings.student_id', '=', 'students.id')
            ->where('rankings.grade_level','=',$id)
            ->select('students.*','rankings.*')
            ->orderBy('average', 'desc')
            ->take(10)
            ->get();

        return view('prints.topStudent', ['data' => $data]);
    }

    public function enrollment($id){
        $student =  DB::table('students')
                ->where('id', $id)
                ->first();
        $data = DB::table('transactions')
                ->where('student_id', $id)
                ->first();

        $code = DB::table('codes')
                ->where('student_id', $id)
                ->first();
        //dd($student);
        return view('prints.enrollmentReciept', ['data' => $data, 'student' => $student, 'code' => $code]);
    }

    public function payment($id){

        $data = DB::table('transactions')
                ->where('id', $id)
                ->first();

        $student = DB::table('students')
                ->where('id', $data->student_id)
                ->first();
        //dd($student);
        return view('prints.paymentReciept', ['data' => $data, 'student'=>$student]);
    }

    public function schedules(){
        $data = DB::table('schedules')
            ->join('subjects','schedules.subject_id','=','subjects.id')
            ->join('teachers','schedules.teachers_id','=','teachers.id')
            ->join('rooms','schedule.room_id','=','room.id')
            ->join('levels','rooms.grade_level','=','levels.id')
            ->select('schedules.*','subjects.title','teachers.name','levels.title')
            ->get();

        return compact('data');
    }
}
