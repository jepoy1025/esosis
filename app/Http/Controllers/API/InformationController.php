<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Requirement;

class InformationController extends Controller
{
    public function infos($id){
         $data = DB::table('students')
            ->join('levels','students.grade_level_id','=','levels.id')
         	->where('students.id','=',$id)
         	->select('students.*','levels.title')
         	->first();

         //dd($data);
         return compact('data');
         	
    }

    public function age($id){
    	$data = DB::table('students')
         	->where('id','=',$id)
         	->first();
        $birthDate = $data->birth_date;
		  //explode the date to get month, day and year
		  $birthDate = explode("-", $birthDate);
		  //get age from date or birthdate
		  $age = (date("md", date("U", mktime(0, 0, 0, $birthDate[1], $birthDate[2], $birthDate[0]))) > date("md")
		    ? ((date("Y") - $birthDate[0]) - 1)
		    : (date("Y") - $birthDate[0]));

		 $data = $age;

		 return compact('data');
    }

    public function parents($id){
    	$data = DB::table('parents')
    		->where('student_id',$id)
    		->get();

    	return compact('data');
    }

    public function emergency($id){
    	$data = DB::table('emergencies')
    		->where('student_id',$id)
    		->first();

    	return compact('data');
    }

    public function siblings($id){
    	$data = DB::table('siblings')
    		->where('student_id', $id)
    		->get();

    	$count = count($data);
    	for($ctr = 0;$ctr<$count;$ctr++){
    		$birth = $data[$ctr]->birth_date;
    		$birth = explode("-", $birth);
		  //get age from date or birthdate
		  	$age = (date("md", date("U", mktime(0, 0, 0, $birth[1], $birth[2], $birth[0]))) > date("md")
		    ? ((date("Y") - $birth[0]) - 1)
		    : (date("Y") - $birth[0]));

		    $data[$ctr]->birth_date = $age;
    	}

    	return compact('data');
    }

    public function lastAttended($id){
        $data = DB::table('past_schools')
            ->join('school_year','past_schools.date','=','school_year.id')
            ->where('past_schools.student_id',$id)
            ->select('past_schools.*','school_year.school_year')
            ->first();
        //dd($data);
        return compact('data');
    }
}
