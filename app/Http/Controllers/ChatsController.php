<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChatsController extends Controller
{
    public function _construct(){
    	$this->middleware('auth');
    }

    public function index(){
    	return view('chats');
    }
}
