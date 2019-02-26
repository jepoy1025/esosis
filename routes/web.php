<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/test','TestController@test');

// Route::get('/', function () {
//     return view('/home');
// });
Route::post('postAjax','TestController@store');


Auth::routes();
//Route::get('/chats','ChatsController@index');
//Route::get('/home', 'HomeController@index')->name('home');

Route::get('invoice',  function(){
	return view('prints.invoice');
});
Route::get('{path}',"HomeController@index")->where( 'path', '([A-z\/_.\d-]+)?' );
