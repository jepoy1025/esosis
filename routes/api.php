<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResources(['user' => 'API\UserController']);
Route::apiResources(['teacher' => 'API\TeacherController']);
Route::apiResources(['level' => 'API\LevelController']);
Route::apiResources(['sy' => 'API\SyController']);
Route::apiResources(['fee' => 'API\FeeController']);
Route::apiResources(['room' => 'API\RoomController']);

Route::put('teacher-active/{teacher}','API\TeacherController@activate');
Route::get('active-teacher','API\TeacherController@actTeacher');
Route::get('inactive-room','API\RoomController@inActive');
Route::put('room-active/{room}','API\RoomController@activate');
//Route::get('teacher', 'API\TeacherController@index');
