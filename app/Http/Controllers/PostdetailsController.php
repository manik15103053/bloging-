<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class PostdetailsController extends Controller
{

    public function postDetails($slug){

    $post  = Post::where('slug',$slug)->first();
    //dd($post->all());
    $randompost = Post::all()->random(3);
    return view('post_details',compact('post','randompost'));

    }

}
