<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminfavoriteController extends Controller
{
    public function favorateIndex(){

        $posts = Auth::user()->favorite_posts;
        return view('admin.favorite.favorite',compact('posts'));
    }

   
}
