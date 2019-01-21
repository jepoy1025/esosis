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
}
