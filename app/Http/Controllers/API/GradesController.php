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
         	->where('status','=','1')
         	->get();

         return compact('data');
         	
    }

    public function gradeList(Request $request, $id){
    	 $data = DB::table('grades')
    	 	->join('subjects','grades.subject_id','=','subjects.id')
         	->where('grades.student_id', $id)
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
        $data = DB::table('grades')
            ->join('subjects','grades.subject_id','=','subjects.id')
            ->where('grades.student_id', $id)
            ->select('grades.*','subjects.title')
            ->get();

        return view('prints.grades', ['data' => $data]);
    }
}
