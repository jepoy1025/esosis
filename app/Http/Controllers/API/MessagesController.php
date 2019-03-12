<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB; 
use App\message;
use App\User;

class MessagesController extends Controller


{
	public function delete($id){

		$message = message::findOrFail($id);
		$user = User::findOrFail($message->user_id);
		$message -> delete();
		$user->update([
			            'notify' => 0,
			        ]);
		$scan = DB::table('messages')
				->where('user_id',$user->id)
				->get();
		$sc_ctr = count($scan);
		for($ctr = 0;$ctr < $sc_ctr;$ctr++){
			if($scan[$ctr]->status == '1'){
				$user->update([
			            'notify' => 1,
			        ]);
			}
		}

		return compact('message');

	}

	public function status($id){
		$message = message::findOrFail($id);
		$message->update([
			            'status' => 0,
			        ]);
		$user = User::findOrFail($message->user_id);
		$user->update([
			            'notify' => 0,
			        ]);
		$scan = DB::table('messages')
				->where('user_id',$user->id)
				->get();
		$sc_ctr = count($scan);
		for($ctr = 0;$ctr < $sc_ctr;$ctr++){
			if($scan[$ctr]->status == '1'){
				$user->update([
			            'notify' => 1,
			        ]);
			}
		}

		return compact('message');

	}

	public function list($id){
		$data = DB::table('messages')
			  ->where('user_id',$id)
			  ->get();

		//dd($data);
		return compact('data');	
	}

    public function announce(Request $request, $id){
    	$test;
    	if($id == 1){
    		$users = DB::table('users')
	    			->where('role_id','=','3')
	    			->orWhere('role_id','=','4')
	    			->get();
	    	$user_ctr = count($users);
	    		for($ctr = 0;$ctr<$user_ctr;$ctr++){
	    			message::create([
			            'subject' => 'Payments Notification',
			            'message' => 'Please check if there are lacking requirements of your student. ( At the student profile click the Requirements tab )',
			            'status' => 1,
			            'user_id' => $users[$ctr]->id,
			        ]);
	    			
	    			$user = User::findOrFail($users[$ctr]->id);
			        $user->update([
			            'notify' => 1,
			        ]);
	    		}
    	}
    	if($id == 2){
	    	$users = DB::table('users')
	    			->where('role_id','=','3')
	    			->orWhere('role_id','=','4')
	    			->get();
	    	$user_ctr = count($users);
	    		for($ctr = 0;$ctr<$user_ctr;$ctr++){
	    			message::create([
			            'subject' => 'Payments Notification',
			            'message' => 'Please settle the ramaining payment in the school. The monthly exam is near',
			            'status' => 1,
			            'user_id' => $users[$ctr]->id,
			        ]);
	    			
	    			$user = User::findOrFail($users[$ctr]->id);
			        $user->update([
			            'notify' => 1,
			        ]);
	    		}
	    	}

	    	if($id == 3){
	    		//dd($request['header']);
	    		if($request['sendTo'] == 1){
		    		$users = DB::table('users')
		    			->where('role_id','=','3')
		    			->orWhere('role_id','=','4')
		    			->get();
		    		$user_ctr = count($users);
		    		for($ctr = 0;$ctr<$user_ctr;$ctr++){
		    			message::create([
				            'subject' => $request['header'],
				            'message' => $request['message'],
				            'status' => 1,
				            'user_id' => $users[$ctr]->id,
				        ]);
		    			
		    			$user = User::findOrFail($users[$ctr]->id);
				        $user->update([
				            'notify' => 1,
				        ]);
		    		}
	    		}
	    		if($request['sendTo'] == 2){
		    		$users = DB::table('users')
		    			->where('role_id','=','3')
		    			->get();
		    		$user_ctr = count($users);
		    		for($ctr = 0;$ctr<$user_ctr;$ctr++){
		    			message::create([
				            'subject' => $request['header'],
				            'message' => $request['message'],
				            'status' => 1,
				            'user_id' => $users[$ctr]->id,
				        ]);
		    			
		    			$user = User::findOrFail($users[$ctr]->id);
				        $user->update([
				            'notify' => 1,
				        ]);
		    		}
	    		}
	    		if($request['sendTo'] == 3){
		    		$users = DB::table('users')
		    			->where('role_id','=','4')
		    			->get();
		    		$user_ctr = count($users);
		    		for($ctr = 0;$ctr<$user_ctr;$ctr++){
		    			message::create([
				            'subject' => $request['header'],
				            'message' => $request['message'],
				            'status' => 1,
				            'user_id' => $users[$ctr]->id,
				        ]);
		    			
		    			$user = User::findOrFail($users[$ctr]->id);
				        $user->update([
				            'notify' => 1,
				        ]);
		    		}
	    		}
	    	}
    	return compact('users');
    }
}
