<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Requirement;

class RequirementsController extends Controller
{
        public function index()
    {
         $data = DB::table('students')
         	->where('status','=','1')
         	->get();

         return compact('data');
         	
    }

    public function reqList(Request $request, $id){
    	 $data = DB::table('requirements')
    	 	->where('student_id',$id)
    	 	->first();
         
        return compact('data');
    }

    public function update(Request $request, $id){
    	$subject = Requirement::findOrFail($id);
    	$subject->update([
            'form_137' => $request['form_137'],
            'birth_cert' => $request['nso'],
            'photo2x2' => $request['picture2x2']
        ]);
        return $subject; 
    }
}
