<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AuthorprofileController extends Controller
{
    public function profile($username){

     $author = User::where('username',$username)->first();
    $posts = $author->posts()->Approved()->Published()->get();

    return view('profile',compact('author','posts'));
    }
}
