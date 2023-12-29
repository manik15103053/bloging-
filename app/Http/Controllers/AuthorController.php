<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Post;
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
        $author = User::find($id);

        if(!$author){
            return redirect()->back()->with('error', 'Author not found.');
        }

        $posts = Post::where('user_id', $id)->get();

        if($posts->isNotEmpty()){
            return redirect()->back()->with('error', 'Sorry, you cannot delete the author. Please delete the author\'s posts first.');
        }else{
            $author->delete();
            return redirect()->back()->with('success', 'Author deleted successfully.');
        }
    }

}
