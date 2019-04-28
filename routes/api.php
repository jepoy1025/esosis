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

Route::get('teacherList', 'API\TeacherController@actTeacher');
Route::get('syList', 'API\SyController@list');
Route::post('checkStudent','API\StudentController@checkname');
Route::post('rankList','API\ReportsController@rankList');


Route::apiResources(['teacher' => 'API\TeacherController']);
Route::apiResources(['level' => 'API\LevelController']);
Route::apiResources(['sy' => 'API\SyController']);
Route::apiResources(['fee' => 'API\FeeController']);
Route::apiResources(['room' => 'API\RoomController']);
Route::apiResources(['subject' => 'API\SubjectController']);
Route::apiResources(['schedule' => 'API\ScheduleController']);
Route::apiResources(['student' => 'API\StudentController']);

//student info
Route::get('prev_grades/{id}','API\GradesController@prevGrades');
Route::get('prev_comments/{id}','API\CommentController@prevComments');
Route::get('studentLevel/{id}','API\GradesController@gradeLevel');
Route::get('studentGrades/{id}','API\GradesController@studentGrades');
Route::get('infos/{id}','API\InformationController@infos');
Route::get('age/{id}','API\InformationController@age');
Route::get('parents/{id}','API\InformationController@parents');
Route::get('emergency/{id}','API\InformationController@emergency');
Route::get('siblings/{id}','API\InformationController@siblings');
Route::get('lastAttended/{id}','API\InformationController@lastAttended');

//students
Route::put('transferedEnroll/{id}','API\StudentController@transferEnroll');
Route::get('studentProfile/{id}','API\StudentController@studentProfile');
Route::get('studentPending','API\StudentController@pending');
Route::get('student-drop','API\StudentController@dropList');
Route::get('transfered','API\StudentController@transferedList');
Route::get('findStudent','API\StudentController@search');
Route::put('rank-student/{id}','API\GradesController@rank');
Route::get('grades','API\GradesController@index');
Route::get('gradePrint/{id}','API\GradesController@print');
Route::get('gradePrintAll/{id}','API\GradesController@printAll');
Route::get('grade-list/{id}','API\GradesController@gradeList');
Route::get('comment-list/{id}','API\CommentController@commentList');
Route::get('requirements-list/{id}','API\RequirementsController@reqList');
Route::get('comment/{id}','API\CommentsController@commentList');
Route::get('student-waiting','API\StudentController@waitingList');
Route::put('grade/{id}','API\GradesController@update');
Route::put('comment/{id}','API\CommentController@update');
Route::put('requirement/{id}','API\RequirementsController@update');   
Route::get('transactionsPrint/{id}','API\ReportsController@transactions');
Route::put('archiveStudent/{id}','API\StudentController@archive');
Route::put('dropStudent/{id}','API\StudentController@dropStudent');
Route::put('oldStudent/{id}','API\StudentController@oldStudent');
Route::put('dropEnroll/{id}','API\StudentController@dropEnroll');

   
Route::put('teacher-active/{teacher}','API\TeacherController@activate');
Route::get('active-teacher','API\TeacherController@actTeacher');
Route::get('inactive-room','API\RoomController@inActive');
Route::get('room-column','API\RoomController@column');
Route::get('deleted-subject','API\SubjectController@deleted');
Route::put('room-active/{room}','API\RoomController@activate');
Route::put('subject-active/{subject}','API\SubjectController@activate');


Route::get('accounts','API\CashierController@index');
Route::get('transactions/{id}','API\CashierController@transactions');
Route::get('balance/{id}', 'API\CashierController@balance');
Route::put('transactions/{id}','API\CashierController@update');
Route::get('studentAccount/{id}','API\CashierController@account');

Route::post('sisAddStudent','API\SisController@addStudent');
Route::get('sisStudentList','API\SisController@studentList');
Route::get('account/{id}','API\SisController@balance');
Route::get('lecture/{id}','API\SisController@lecture');

//reports
Route::get('prevGradePrint/{id}','API\ReportsController@prevGradePrint');
Route::get('testPrint/{id}','API\ReportsController@generatePDF');
Route::get('rankPrint/{id}','API\ReportsController@topStudents');
Route::get('rankPrintFirst/{id}','API\ReportsController@topStudentsFirst');
Route::get('rankPrintSecond/{id}','API\ReportsController@topStudentsSecond');
Route::get('rankPrintThird/{id}','API\ReportsController@topStudentsThird');
Route::get('rankPrintFourth/{id}','API\ReportsController@topStudentsFourth');
Route::get('getSchedule', 'API\ReportsController@schedules');
Route::get('studentRoom/{id}','API\ReportsController@studentRoom');
Route::get('studentRank/{id}','API\ReportsController@studentRank');
Route::get('enrollmentPrint/{id}','API\ReportsController@enrollment');
Route::get('payment/{id}','API\ReportsController@payment');
Route::get('reEnrollPrint/{id}','API\ReportsController@reEnroll');
Route::get('transferEnrollPrint/{id}','API\ReportsController@transferEnrollPrint');
Route::get('printAllSchedule','API\ReportsController@allSchedule');
Route::get('gradeReport/{level}','API\ReportsController@gradeReport');
Route::get('gradeReports/{level}','API\ReportsController@gradesReport');
Route::get('transactionReport','API\ReportsController@transactionReport');
Route::get('transactionReportAnnual/{year}','API\ReportsController@transactionReportAnnual');
Route::get('transactionReportMonth/{month}','API\ReportsController@transactionReportMonth');
Route::get('transactionReportRange/{range}','API\ReportsController@transactionReportRange');
Route::get('printSchedIndi/{id}','API\ReportsController@SchedIndi');
//Route::get('roomSchedule/{room}','API\ReportsController@roomSchedule');


//notification
Route::put('announce/{id}','API\MessagesController@announce');
Route::get('notificationList/{id}', 'API\MessagesController@list');
Route::put('notificationStatus/{id}','API\MessagesController@status');
Route::delete('notificationDelete/{id}','API\MessagesController@delete');
Route::get('roomSchedule/{room}','API\ReportsController@roomSchedule');

//Route::get('teacher', 'API\TeacherController@index');
