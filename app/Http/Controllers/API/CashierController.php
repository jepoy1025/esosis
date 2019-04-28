<?php

namespace App\Http\Controllers\API;


use Auth;
// use JWTAuth;
use Illuminate\Http\Request;
//use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Transaction;
use App\Payment;
use App\Log;
use App\User;

class CashierController extends Controller
{
    public function account($id){
        $data = DB::table('payments')
            ->where('student_id', $id)
            ->first();

        return compact('data');
    }
    public function index()
    {
         $data = DB::table('payments')
         	->join('students','payments.student_id','=','students.id')
         	->select('payments.*','students.first_name','students.last_name')
            ->orderBy('students.last_name', 'asc')
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
        $month = date('F');
        $label = '';
        $student = DB::table('students')
                ->where('id',$id)
                ->first();
    	$amounts = DB::table('payments')
    		->where('student_id',$id)
    		->first();

    	//dd($request);
        if($request['checkEnrollment'] == true){
            $amounts->enrollment_fee = $amounts->enrollment_fee - $request['enrollment'];
            $label = $label . ', Registration fee - P '.$request['enrollment'];
        }

        if($request['checkTuition'] == true){
            $amounts->whole_year = $amounts->whole_year - $request['tuition'];
            $label = $label . ', '.$month.' Tuition fee - P '.$request['tuition'];
        }

        if($request['checkMisc'] == true){
            $amounts->misc = $amounts->misc - $request['misc'];
            $label = $label . ', Miscellaneous fee - P '.$request['misc'];
        }

        if($request['checkBooks'] == true){
            $amounts->books = $amounts->books - $request['books'];
            $label = $label . ', Books fee - P '.$request['books'];
        }

        if($request['checkUniform'] == true){
            $amounts->uniform = $amounts->uniform - $request['uniform'];
            $label = $label . ', Uniform fee - P '.$request['uniform'];
        }

        if($request['checkPta'] == true){
            $amounts->pta = $amounts->pta - $request['pta'];
            $label = $label . ', Pta fee - P '.$request['pta'];
        }

        if($request['checkPastBalance'] == true){
            $amounts->past_balance = $amounts->past_balance - $request['pastBalance'];
            $label = $label . ', Others fee - P '.$request['pastBalance'];
        }

        DB::table('payments')
            ->where('student_id', $id)
            ->update([
                'past_balance' => $amounts->past_balance,
                'enrollment_fee' => $amounts->enrollment_fee,
                'whole_year' => $amounts->whole_year,
                'misc' => $amounts->misc,
                'books' => $amounts->books,
                'uniform' => $amounts->uniform,
                'pta' => $amounts->pta,
            ]);

        Transaction::create([
            'student_id' => $id,
            'type' => $label,
            'amount' => $request['total'],
        ]);

        $trans = DB::table('transactions')
          ->where('student_id','=',$amounts->student_id)
          ->orderBy('id', 'desc')
          ->first();
        $data = $trans->id;

        //$user = Auth::User();

        //dd($user);
        
        $userLog = auth('api')->id();
        Log::create([
            'user_id' => $userLog,
            'activity' => $label . ' ' . $request['total'] . ' for ' . $student->last_name . ', ' . $student->first_name
        ]);

        

        return compact('data');
    }

    public function balance($id){
        $data = DB::table('payments')
                ->where('student_id', $id)
                ->first();

        return compact('data');
    }
}
