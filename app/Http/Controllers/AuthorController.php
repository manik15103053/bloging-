<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    public function authorList(){

        $authors = User::authors()
        ->withCount('posts')
        ->withCount('comments')
        ->withCount('favorite_posts')
        ->get();

        return view('admin.author',compact('authors'));
    }

    public function authorDelete($id){
       
         $author = User::find($id)->delete();
        //dd($author);
        return redirect()->back()->with('msg','Author Delete Successfully.');
    }
}
