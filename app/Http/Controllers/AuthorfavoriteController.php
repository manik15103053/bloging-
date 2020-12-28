<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthorfavoriteController extends Controller
{
    public function authorfavoriteIndex(){

        $posts = Auth::user()->favorite_posts;
        return view('author.favorite.favorite',compact('posts'));
    }
}
