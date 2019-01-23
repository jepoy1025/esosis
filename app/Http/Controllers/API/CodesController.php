<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class CodesController extends Controller
{
    public function index(){
    	$data = DB::table('codes')
         	->join('students','codes.student_id','=','students.id')
         	->select('codes.*','students.first_name','students.last_name')
         	->get();

        return compact('data');
    }
}
