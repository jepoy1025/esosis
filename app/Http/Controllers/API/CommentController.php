<?php   

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Comment;

class CommentController extends Controller
{
    public function prevComments($id)
    {
        $sy = DB::table('level_student')
            ->where('id',$id)
            ->first();

        $data = DB::table('comments')
            ->where([
                ['student_id', '=', $sy->student_id],
                ['sy_id', '=', $sy->sy_id],

            ])
            ->first();

        return compact('data');
    }

    public function commentList(Request $request, $id){
        $student = DB::table('students')->where('id',$id)->first();
        //dd($student);
    	$data = DB::table('comments')
    	 	->where([
                ['comments.student_id', '=', $id],
                ['comments.grade_level', '=', $student->grade_level_id],

            ])
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
