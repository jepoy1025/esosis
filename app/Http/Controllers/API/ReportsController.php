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
}
