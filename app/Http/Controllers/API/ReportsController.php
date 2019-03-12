<?php

namespace App\Http\Controllers\API;

use App\Level;
use App\Student;
use App\Room;
use App\Subject;
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

    public function topStudentsFirst($id){
        $data = DB::table('first_rankings')
            ->join('students', 'first_rankings.student_id', '=', 'students.id')
            ->where('first_rankings.grade_level','=',$id)
            ->select('students.*','first_rankings.*')
            ->orderBy('average', 'desc')
            ->take(10)
            ->get();

        $level = DB::table('levels')
                ->where('id', $id)
                ->first();

        return view('prints.topStudent', ['data' => $data, 'level' => $level]);
    }

    public function topStudentsSecond($id){
        $data = DB::table('second_rankings')
            ->join('students', 'second_rankings.student_id', '=', 'students.id')
            ->where('second_rankings.grade_level','=',$id)
            ->select('students.*','second_rankings.*')
            ->orderBy('average', 'desc')
            ->take(10)
            ->get();

        $level = DB::table('levels')
                ->where('id', $id)
                ->first();

        return view('prints.topStudent', ['data' => $data, 'level' => $level]);
    }

    public function topStudentsThird($id){
        $data = DB::table('third_rankings')
            ->join('students', 'third_rankings.student_id', '=', 'students.id')
            ->where('third_rankings.grade_level','=',$id)
            ->select('students.*','third_rankings.*')
            ->orderBy('average', 'desc')
            ->take(10)
            ->get();

        $level = DB::table('levels')
                ->where('id', $id)
                ->first();

        return view('prints.topStudent', ['data' => $data, 'level' => $level]);
    }

    public function topStudentsFourth($id){
        $data = DB::table('fourth_rankings')
            ->join('students', 'fourth_rankings.student_id', '=', 'students.id')
            ->where('fourth_rankings.grade_level','=',$id)
            ->select('students.*','fourth_rankings.*')
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
        $rooms = DB::table('rooms')
                ->join('levels','rooms.grade_level','levels.id')
                ->select('rooms.*','levels.title')
                ->where('status','active')
                ->get();

        $schedules = DB::table('schedules')
                ->join('subjects','schedules.subject_id','=','subjects.id')
                ->join('teachers','subjects.teacher_id','=','teachers.id')
                ->select('schedules.*','subjects.title','subjects.duration','teachers.name')
                ->orderBy('schedules.start_time', 'asc')
                ->get();

        //dd($rooms);
        
        //dd($data);

        return view('prints.integratedSched', ['rooms' => $rooms, 'schedules' => $schedules]);
    }

    public function gradeReport(Request $request, Level $level)
    {
        $student_ids = $level->grades()
            ->groupBy('student_id')
            ->get(['student_id']);
        $students = Student::whereIn('id', $student_ids)->get();
        $subjects = Subject::where('level', $level->id)->get();

        //dd($students);
        return view('prints.gradeReport', compact('students', 'subjects', 'level'));
    }

    public function transactionReport(){
        $data = DB::table('transactions')
                ->join('students','transactions.student_id','=','students.id')
                ->select('transactions.*','students.last_name','students.first_name')
                ->get();
        $title = 'All Transaction Report';
        //dd($data);

        return view('prints.transactionsAll', ['data' => $data, 'title' => $title]);
    }

    public function transactionReportAnnual($year){
        $data = DB::table('transactions')
                ->join('students','transactions.student_id','=','students.id')
                ->whereYear('transactions.created_at', '=', $year)
                ->select('transactions.*','students.last_name','students.first_name')
                ->get();
        //dd($data);

        $title = 'Transaction Report in '. $year;

        return view('prints.transactionsAll', ['data' => $data, 'title' => $title]);
    }

    public function transactionReportMonth($month){
        $exp = explode("-",$month);
        $data = DB::table('transactions')
                ->join('students','transactions.student_id','=','students.id')
                ->whereYear('transactions.created_at', '=', $exp[1])
                ->whereMonth('transactions.created_at', '=', $exp[0])
                ->select('transactions.*','students.last_name','students.first_name')
                ->get();
        $month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        $title = 'Transaction Report in '. $month[$exp[0]-1].' year '. $exp[1];
        
        return view('prints.transactionsAll', ['data' => $data, 'title' => $title]);
    }

    public function transactionReportRange($range){
        $exp = explode("+",$range);
        $data = DB::table('transactions')
                ->join('students','transactions.student_id','=','students.id')
                ->whereDate('transactions.created_at', '>=', $exp[0])
                ->whereDate('transactions.created_at', '<=', $exp[1])
                ->select('transactions.*','students.last_name','students.first_name')
                ->get();
        $title = 'Transaction Report from '. $exp[0].' to '. $exp[1];
        return view('prints.transactionsAll', ['data' => $data, 'title' => $title]);
    }

    public function SchedIndi($id){
        $room1 = DB::table('schedules')
            ->join('subjects','schedules.subject_id','=','subjects.id')
            ->join('teachers','subjects.teacher_id','=','teachers.id')
            ->select('schedules.*','teachers.name','subjects.title','subjects.duration')
            ->orderBy('schedules.start_time', 'asc')
            ->where('schedules.room_id', $id)
            ->get();

        $name = DB::table('rooms')
                ->join('levels','rooms.grade_level','=','levels.id')
                ->where('rooms.id',$id)
                ->first();

        return view('prints.scheduleIndi', ['room1' => $room1, 'name' => $name]);
    }
}
