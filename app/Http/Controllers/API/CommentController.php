<?php 

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Comment;

class CommentController extends Controller
{
    public function index()
    {

         	
    }

    public function commentList(Request $request, $id){
    	$data = DB::table('comments')
    	 	->where('student_id',$id)
    	 	->first();
         
        return compact('data');
    }

    public function update(Request $request, $id){
    	$subject = Comment::findOrFail($id);
    	$subject->update([
            'first' => $request['first'],
            'second' => $request['second'],
            'third' => $request['third'],
            'fourth' => $request['fourth']
        ]);
        return $subject; 
    }
}
