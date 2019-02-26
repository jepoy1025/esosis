<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use NumberToWords\NumberToWords;

class ReportsController extends Controller
{
    public function generatePDF($id){
        $info = DB::table('rooms')
                ->join('levels','rooms.grade_level','levels.id')
                ->join('teachers','rooms.advicer_id','teachers.id')
                ->where('rooms.id','=',$id)
                ->select('rooms.*','teachers.name','levels.title')
                ->first();
    	$data = DB::table('students')
    		->where([
			    ['lecture_id', '=', $id],
			    ['status', '=', 1],
			])
            ->orderBy('last_name', 'asc')
    		->get();
    	return view('prints.invoice', ['data' => $data, 'info' => $info]);
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
        $student = DB::table('students')
            ->join('levels','students.grade_level_id','levels.id')
            ->join('rooms','students.lecture_id','rooms.id')
            ->where('students.id', $id)
            ->select('students.*','levels.title','rooms.section')
            ->first();
        $data = DB::table('transactions')
            ->where('student_id', $id)
            ->get();

         return view('prints.transaction', ['data' => $data, 'student' => $student]);
    }

    public function studentRank($id){
        $data = DB::table('rankings')
            ->join('students', 'rankings.student_id', '=', 'students.id')
            ->where('rankings.grade_level','=',$id)
            ->select('students.*','rankings.*')
            ->orderBy('average', 'desc')
            ->take(10)
            ->get();

        $level = DB::table('levels')
                ->where('id', $id)
                ->first();

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

        $level = DB::table('levels')
                ->where('id', $id)
                ->first();

        return view('prints.topStudent', ['data' => $data, 'level' => $level]);
    }

    public function enrollment($id){
        $student =  DB::table('students')
                ->join('rooms','students.lecture_id','=','rooms.id')
                ->join('levels','rooms.grade_level','=','levels.id')
                ->where('students.id', $id)
                ->select('students.*','levels.title','rooms.section')
                ->first();
        $payment = DB::table('payments')
                ->where('payments.student_id', $student->id)
                ->first();
        $data = DB::table('transactions')
                ->where('student_id', $id)
                ->first();
        $numberToWords = new NumberToWords();
        $numberTransformer = $numberToWords->getNumberTransformer('en');
        $amount = $numberTransformer->toWords($data->amount);
        $code = DB::table('codes')
                ->where('student_id', $id)
                ->first();
        //dd($code);
        //dd($student);
        return view('prints.enrollmentReciept', ['data' => $data, 'student' => $student, 'code' => $code, 'payment' => $payment, 'amount' => $amount]);
    }

    public function payment($id){

        $data = DB::table('transactions')
                ->where('id', $id)
                ->first();

        $student =  DB::table('students')
                ->join('rooms','students.lecture_id','=','rooms.id')
                ->join('levels','rooms.grade_level','=','levels.id')
                ->where('students.id', $data->student_id)
                ->select('students.*','levels.title','rooms.section')
                ->first();

        $payment = DB::table('payments')
                ->where('payments.student_id', $student->id)
                ->first();

        $numberToWords = new NumberToWords();
        $numberTransformer = $numberToWords->getNumberTransformer('en');
        $amount = $numberTransformer->toWords($data->amount);

        $paid = explode(",",$data->type);
        $paid2 = $paid;
        //dd($paid);
        return view('prints.paymentReciept', ['data' => $data, 'student'=>$student, 'payment' => $payment, 'amount' => $amount, 'paid'=>$paid, 'paid2' => $paid2]);
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

    public function reEnroll($id){
        $data = DB::table('transactions')
                    ->where('student_id',$id)
                    ->orderBy('id', 'desc')
                    ->first();
        $student =  DB::table('students')
                ->join('rooms','students.lecture_id','=','rooms.id')
                ->join('levels','rooms.grade_level','=','levels.id')
                ->where('students.id', $id)
                ->select('students.*','levels.title','rooms.section')
                ->first();
        $payment = DB::table('payments')
                ->where('payments.student_id', $student->id)
                ->first();
        $numberToWords = new NumberToWords();
        $numberTransformer = $numberToWords->getNumberTransformer('en');
        $amount = $numberTransformer->toWords($data->amount);

        return view('prints.reEnrollReciept', ['data' => $data, 'student'=>$student, 'payment'=>$payment, 'amount'=>$amount]);
    }

    public function allSchedule(){
        $data = DB::table('schedules')
            ->join('subjects','schedules.subject_id','=','subjects.id')
            ->join('teachers','subjects.teacher_id','=','teachers.id')
            ->select('schedules.*','teachers.name','subjects.title')
            ->orderBy('schedules.start_time', 'asc')
            ->get();
        
        //dd($data);

        return view('prints.scheduleAll', ['data' => $data]);
    }
}
