<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Collection\Paginate;


class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $this->middleware('auth:api');
    }


    public function index()
    {
        return DB::table('users')
                    ->join('roles','users.role_id','=','roles.id')
                    ->select('users.*','roles.role')
                    ->latest()
                    ->paginate(10);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $this->validate($request,[
            'first_name' => 'required|string|max:50',
            'middle_name' => 'required|string|max:50',
            'last_name' => 'required|string|max:50',
            'username' => 'required|string|min:8|max:10|unique:users',
            'email' => 'required|string|unique:users',
            'password' => 'required|string|min:6',
        ]);

        return User::create([
            'first_name' => $request['first_name'],
            'middle_name' => $request['middle_name'],
            'last_name' => $request['last_name'],
            'username' => $request['username'],
            'email' => $request['email'],
            'role_id' => $request['user_type'],
            'photo' => $request['photo'],
            'password' => Hash::make($request['password'])
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function profile(){
        return auth('api')->user();
    }

    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {   
        $user = User::findOrFail($id);
        $this->validate($request,[
            'username' => 'required|string|min:6|max:15|unique:users,username,'.$user->id,
            'email' => 'required|string|unique:users,email,'.$user->id,
            'password' => 'sometimes|min:6',
        ]);
        $user->update([
            'first_name' => $request['first_name'],
            'middle_name' => $request['middle_name'],
            'last_name' => $request['last_name'],
            'username' => $request['username'],
            'email' => $request['email'],
            'role_id' => $request['user_type'],
            'photo' => $request['photo']
        ]);
        return $user;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user -> delete();
        return ['message' => 'User Deleted'];
    }

    public function sponsors(){
        $data =  DB::table('users')
                    ->where('role_id',4)
                    ->get();

        return compact('data');
    }

     public function parents(){
        $data =  DB::table('users')
                    ->where('role_id',3)
                    ->get();

        return compact('data');
    }
}
