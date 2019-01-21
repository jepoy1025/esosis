<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class SisController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function addStudent(request $request){
    	$code = $request['studentCode'];
    	$check = DB::table('codes')
    		->where('code',$code)
    		->first();

    	if($check ==  null){
    		return Response::json(['error' => 'The Code is Invalid'], 404);
    	}else{
    		$student_id = $check->student_id;
    		if($request['role_id'] == 3){
    			DB::table('parent_student')->insert(
			    [
			    	'student_id' => $student_id, 
			    	'parent_id' => $request['id']
				]);
    		}else{
    			DB::table('sponsor_students')->insert(
			    [
			    	'student_id' => $student_id, 
			    	'sponsor_id' => $request['id']
				]);
    		}
    		DB::table('codes')->where('code', '=', $request['studentCode'])->delete();
    		return $code;
    		
    	}
    }

    public function studentList(){
        $user = auth('api')->user();
        if($user->role_id == 3){ 
        $data = DB::table('parent_student')
            ->join('students','parent_student.student_id','=','students.id')
            ->join('levels','students.grade_level_id','=','levels.id')
            ->where('parent_student.parent_id',$user->id)
            ->select('students.*','levels.title')
            ->get();
        }else{
        $data = DB::table('sponsor_students')
            ->join('students','sponsor_students.student_id','=','students.id')
            ->join('levels','students.grade_level_id','=','levels.id')
            ->where('sponsor_students.sponsor_id',$user->id)
            ->select('students.*','levels.title')
            ->get();
        }
        return compact('data');
    }

    public function balance(Request $request, $id){
        $data = DB::table('payments')
            ->where('student_id', $id)
            ->first();

        return compact('data');
    }
}
