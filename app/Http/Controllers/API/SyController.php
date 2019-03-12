<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Collection\Paginate;

class SyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return DB::table('school_year')
                    ->latest()
                    ->paginate(10);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
            'school_year' => 'required|max:50|unique:school_year',
        ]);

        $syCurrent = DB::table('school_year')
                    ->orderBy('id', 'desc')
                    ->first();
        $year = $syCurrent->school_year+1;
        //dd($year);
        $data = DB::table('school_year')->insert(['school_year' =>  $year]);

                DB::table('students')
                 ->where('status','=',1)
                 ->update(array('status' => 2));
        return compact('data');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
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
        $sy = DB::table('school_year')->where('id', $id)->first();
        $this->validate($request,[
            'school_year' => 'required|max:50|unique:school_year,school_year,'.$sy->id,
        ]);
        $sy = DB::table('school_year')
            ->where('id', $id)
            ->update(['school_year' => $request['school_year']]);
        return compact('sy');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
