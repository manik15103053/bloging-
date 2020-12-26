<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use App\Models\Post;
use App\Models\Category;
use App\Models\Subscribe;
use App\Notifications\AuthorPostApproved;
use App\Notifications\NewPostSubscribe;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function postIndex(){
  

        $posts = Post::latest()->get();
        return view('admin.post.index',compact('posts'));


    }

    public function createPost(){
        $categories  = Category::all();
        $tags        =Tag::all();

        return view('admin.post.create',compact('categories','tags'));
    }
    public function postStore(Request $request){

        $this->validate($request,[

            'title'   =>  'required',
            'image'   =>  'required',
            'categories'   =>  'required',
            'tags'   =>  'required',
            'body'   =>  'required'

        ]);

        $image = $request->file('image');

        

        $slug = Str::slug($request->title);

        if ($request->hasFile('image')) {
            $currentDate = Carbon::now()->toDateString();

            $imagename = $slug . '-' . $currentDate . '-' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('category', $imagename);
        } else {
            $imagename  = "default.png";
        }
       
        $post = new Post();
        $post->user_id  = Auth::id();
        $post->title    = $request->title;
        $post->slug     = $slug;
        $post->image    = $imagename;
        $post->body     = $request->body;
        if(isset($request->status)){
            $post->status  = true;
        }else{
            $post->status  = false;
        }
        $post->is_approved  = true;
        $post->save();
        $post->categories()->attach($request->categories);
        $post->tags()->attach($request->tags);

        //Subscriber 
        $subscribers = Subscribe::all();
        foreach($subscribers as $subcriber){
            Notification::route('mail',$subcriber->email)
            ->notify(new NewPostSubscribe($post));
        }


        return redirect(route('post.index'))->with('msg','Post Successfully Sava.');

    }

    public function postEdit($id){

        $post = Post::find($id);
        $categories  = Category::all();
        $tags        =Tag::all();

        return view('admin.post.edit',compact('post','categories','tags'));
    }

    ///Update Post

    public function postUpdate(Request $request, $id)
    {

        $this->validate($request, [
            'title'   =>  'required',
            'image'   =>  '',
            'categories'   =>  'required',
            'tags'   =>  'required',
            'body'   =>  'required'

        ]);
        $post =  Post::find($id);

        $old_file_name = $post->image;

        $image = $request->file('image');

        $slug = Str::slug($request->name);
    

        if ($request->hasFile('image')) {
            $currentDate = Carbon::now()->toDateString();

            $imagename = $slug . '-' . $currentDate . '-' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('category', $imagename);
            @unlink(public_path('uploads/category/'.$old_file_name));
           

        } else {
            $imagename  = "default.png";
        }
       
        $post->user_id  = Auth::id();
        $post->title    = $request->title;
        $post->slug     = $slug;
        $post->image    = $imagename;
        $post->body     = $request->body;
        if(isset($request->status)){
            $post->status  = true;
        }else{
            $post->status  = false;
        }
        $post->is_approved  = true;
        $post->save();
        $post->categories()->sync($request->categories);
        $post->tags()->sync($request->tags);


        return redirect(route('post.index'))->with('msg','Post Successfully Update.');
    }

    ///Delete Post

    public function postDelete($id){

        $post =  Post::find($id);
        @unlink(public_path('uploads/category/'.$post->image));

        $post->categories()->detach();
        $post->tags()->detach();

        $post->delete();
     
     return redirect(route('post.index'))->with('msg','Post Delete Successfully.');
 }
 //Post Show 

 public function postShow($id){
    
    $post  = Post::find($id);
   
    return view('admin.post.show',compact('post'));
 }

 public function postPending(){

    $posts  = Post::where('is_approved',false)->get();
    return view('admin.post.pending',compact('posts'));
 }

 public function postApprove($id){
     $post  =Post::find($id);
     if($post->is_approved  == false){
         $post->is_approved  = true;
         $post->save();
         ///Notification
         $post->user->notify(new AuthorPostApproved($post));

           $subscribers = Subscribe::all();
           foreach($subscribers as $subcriber){
            Notification::route('mail',$subcriber->email)
            ->notify(new NewPostSubscribe($post));
         }


         return redirect()->back()->with('msg','Post Successfully Approved.');
     }else{
         return redirect()->back()->with('msg','This Post is already Approved.');
     }
     
 }
}