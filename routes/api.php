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

Route::get('profile', 'API\UserController@profile');

Route::get('codes', 'API\CodesController@index');

Route::apiResources(['user' => 'API\UserController']);
Route::get('sponsor', 'API\UserController@sponsors');
Route::get('parents', 'API\UserController@parents');
Route::get('parentsStudents/{id}', 'API\StudentController@parentGet');
Route::get('sponsorStudents/{id}', 'API\StudentController@sponsorGet');


Route::apiResources(['teacher' => 'API\TeacherController']);
Route::apiResources(['level' => 'API\LevelController']);
Route::apiResources(['sy' => 'API\SyController']);
Route::apiResources(['fee' => 'API\FeeController']);
Route::apiResources(['room' => 'API\RoomController']);
Route::apiResources(['subject' => 'API\SubjectController']);
Route::apiResources(['schedule' => 'API\ScheduleController']);
Route::apiResources(['student' => 'API\StudentController']);


Route::put('rank-student/{id}','API\GradesController@rank');
Route::get('grades','API\GradesController@index');
Route::get('gradePrint/{id}','API\GradesController@print');
Route::get('grade-list/{id}','API\GradesController@gradeList');
Route::get('comment-list/{id}','API\CommentController@commentList');
Route::get('requirements-list/{id}','API\RequirementsController@reqList');
Route::get('comment/{id}','API\CommentsController@commentList');
Route::get('student-waiting','API\StudentController@waitingList');
Route::put('grade/{id}','API\GradesController@update');
Route::put('comment/{id}','API\CommentController@update');
Route::put('requirement/{id}','API\RequirementsController@update');
Route::get('transactionsPrint/{id}','API\ReportsController@transactions');


Route::put('teacher-active/{teacher}','API\TeacherController@activate');
Route::get('active-teacher','API\TeacherController@actTeacher');
Route::get('inactive-room','API\RoomController@inActive');
Route::get('room-column','API\RoomController@column');
Route::get('deleted-subject','API\SubjectController@deleted');
Route::put('room-active/{room}','API\RoomController@activate');
Route::put('subject-active/{subject}','API\SubjectController@activate');

Route::get('accounts','API\CashierController@index');
Route::get('transactions/{id}','API\CashierController@transactions');
Route::put('transactions/{id}','API\CashierController@update');

Route::post('sisAddStudent','API\SisController@addStudent');
Route::get('sisStudentList','API\SisController@studentList');
Route::get('account/{id}','API\SisController@balance');

Route::get('testPrint/{id}','API\ReportsController@generatePDF');
Route::get('rankPrint/{id}','API\ReportsController@topStudents');
Route::get('studentRoom/{id}','API\ReportsController@studentRoom');
Route::get('studentRank/{id}','API\ReportsController@studentRank');

//Route::get('teacher', 'API\TeacherController@index');
