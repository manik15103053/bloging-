<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class SearchController extends Controller
{
   public function searchIndex(Request $request){

    //dd($request->all());

    $query  = $request->input('query');

    $posts = Post::where('title','LIKE',"%$query%")->Approved()->Published()->get();
    return view('search',compact('posts','query'));
  
   }
}
