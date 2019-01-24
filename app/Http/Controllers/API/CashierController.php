<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Transaction;
use App\Payment;

class CashierController extends Controller
{
    public function index()
    {
         $data = DB::table('payments')
         	->join('students','payments.student_id','=','students.id')
         	->select('payments.*','students.first_name','students.last_name')
         	->get();


         return compact('data');
         	
    }

    public function transactions(Request $request, $id){
    	 $data = DB::table('transactions')
         	->where('student_id', $id)
         	->get();

         return compact('data');
    }

    public function update(Request $request, $id){
    	$amounts = DB::table('payments')
    		->where('id',$id)
    		->first();

    	$payment = Payment::findOrFail($id);
		 
    	if($request['type'] == 1){
    		$dummy = $amounts->whole_year - $request['amount'];

    		$payment->update([
            'whole_year' => $dummy

        ]);
    		transaction::create([
            'student_id' => $amounts->student_id,
            'type' => 'Tuition',
            'amount' => $request['amount']
        ]);

    	}
    	if($request['type'] == 2){
    		$dummy = $amounts->misc - $request['amount'];
    		$payment->update([
            'misc' => $dummy

        ]);
    		transaction::create([
            'student_id' => $amounts->student_id,
            'type' => 'Miscellaneos',
            'amount' => $request['amount']
        ]);

    	}
    	if($request['type'] == 3){
    		$dummy = $amounts->books - $request['amount'];
    		$payment->update([
            'books' => $dummy
        ]);
    		transaction::create([
            'student_id' => $amounts->student_id,
            'type' => 'Books Payment',
            'amount' => $request['amount']
        ]);
    	}
    	if($request['type'] == 4){
    		$dummy = $amounts->uniform - $request['amount'];
    		$payment->update([
            'uniform' => $dummy

        ]);
    		transaction::create([
            'student_id' => $amounts->student_id,
            'type' => 'Uniform',
            'amount' => $request['amount']
        ]);
    	}
    	if($request['type'] == 5){
    		$dummy = $amounts->past_balance - $request['amount'];
    		$payment->update([
            'past_balance' => $dummy

        ]);
    		transaction::create([
            'student_id' => $amounts->student_id,
            'type' => 'Others',
            'amount' => $request['amount']
        ]);
    	}
    	$payment->update([
            'first' => $request['first'],
            'second' => $request['second'],
            'third' => $request['third'],
            'fourth' => $request['fourth']
        ]);

        $trans = DB::table('transactions')
          ->where('student_id','=',$amounts->student_id)
          ->orderBy('id', 'desc')
          ->first();
        $data = $trans->id;

        return compact('data');
    }
}
