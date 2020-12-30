<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class PostdetailsController extends Controller
{


    public function allPost(){

        $posts = Post::latest()->paginate(9);

        return view('posts',compact('posts'));
    }


    public function postDetails($slug){

    $post  = Post::where('slug',$slug)->first();

    $blogKey  = 'blog_' . $post->id;
    if(!Session::has($blogKey)){

        $post->increment('view_count');
        Session::put($blogKey,1);

    }
    //dd($post->all());
    $randompost = Post::all()->random(3);
    return view('post_details',compact('post','randompost'));

    }

}
