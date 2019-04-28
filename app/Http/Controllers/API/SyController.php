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
       $data = DB::table('school_year')
        ->orderBy('id','DESC')
        ->first();

        return compact('data');
    }

    public function list(){
        $data = DB::table('school_year')
                ->get();
        //dd($data);
        return compact('data');
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
        $sy = DB::table('school_year')
        ->orderBy('id','DESC')
        ->first();

        $year = explode("-",$sy->school_year);
        $newSY = $year[1]."-".($year[1]+1);
        $data = DB::table('school_year')->insert(['school_year' =>  $newSY]);

        DB::table('first_rankings')->truncate();
        DB::table('second_rankings')->truncate();
        DB::table('third_rankings')->truncate();
        DB::table('fourth_rankings')->truncate();
        DB::table('rankings')->truncate();
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
