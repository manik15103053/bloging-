<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    public function comment(Request $request,$post){

        $this->validate($request,[

            'comment'  => 'required'

        ]);

        $comment = new Comment();
        $comment->user_id = Auth::id();
        $comment->post_id  = $post;
        $comment->comment  = $request->comment;
        $comment->save();
        return redirect()->back()->with('msg','Comment Successfully Published.'); 

    }
    public function adminComment(){

        $comments  =  Comment::latest()->get();
        return view('admin.comments.comment',compact('comments'));
    }

    public function admincommentDelete($id){

        $comment = Comment::find($id)->delete();

        return redirect()->back()->with('msg','Comment Delete Successfully.');
    }

    ///Author Comment List 

    public function auhtorComment(){

        $posts = Auth::user()->posts;
        return view('author.comments.comment',compact('posts'));
    }

    public function authorcommentDelete($id){

        $comment = Comment::find($id);
        if($comment->post->user->id == Auth::id()){

            $comment->delete();
            return redirect()->back()->with('msg','Comment Delete Successfully.');

        }else{
            return redirect()->back()->with('error','You are not authorized to delete this comment: ');


        }

        return redirect()->back();
    }
}
