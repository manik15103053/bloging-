<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use App\Models\Post;
use App\Models\User;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Notifications\NewAuthorPost;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;

class AuthorpostController extends Controller
{
    public function authorIndex(){
  

        $posts = Auth::User()->posts()->latest()->get();
        return view('author.post.index',compact('posts'));


    }

    public function authorCreate(){
        $categories  = Category::all();
        $tags        =Tag::all();

        return view('author.post.create',compact('categories','tags'));
    }

    public function authorStore(Request $request){

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
        $post->is_approved  = false;
        $post->save();
        $post->categories()->attach($request->categories);
        $post->tags()->attach($request->tags);

        ////Notification 
        $users  =  User::where('role_id','1')->get();

        foreach($users as $user){
            Notification::send($user,new NewAuthorPost($post));
        }
        


        return redirect(route('author.post.index'))->with('msg','Post Successfully Sava.');

    }

    public function authorEdit($id){

        $post = Post::find($id);
        if($post->user_id != Auth::id()){

            return redirect()->back()->with('msg','You are not authorized to access this Post','error');
        }
        $categories  = Category::all();
        $tags        =Tag::all();

        return view('author.post.edit',compact('post','categories','tags'));
    }

    public function authorUpdate(Request $request, $id)
    {

        $this->validate($request, [
            'title'   =>  'required',
            'image'   =>  '',
            'categories'   =>  'required',
            'tags'   =>  'required',
            'body'   =>  'required'

        ]);
        
        $post =  Post::find($id);
        if($post->user_id != Auth::id()){

            return redirect()->back()->with('msg','You are not authorized to access this Post','error');
        }

        $old_file_name = $post->image;

        $image = $request->file('image');

        $slug = Str::slug($request->name);
    

        if ($request->hasFile('image')) {
            $currentDate = Carbon::now()->toDateString();

            $imagename = $slug . '-' . $currentDate . '-' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('category', $imagename);
            if(file_exists(public_path($post->image)) && public_path($post->image) != NULL && public_path($post->image) != '')
            unlink(public_path('uploads/category/'.$old_file_name));
           

        } else {
            $imagename  = $post->image;
        }
       
        $post->user_id  = Auth::id();
        $post->title    = $request->title;
        $post->image    = $imagename;
        $post->body     = $request->body;
        if(isset($request->status)){
            $post->status  = true;
        }else{
            $post->status  = false;
        }
        $post->is_approved  = false;
        dd($post);
        $post->save();
        $post->categories()->sync($request->categories);
        $post->tags()->sync($request->tags);


        return redirect(route('author.post.index'))->with('msg','Post Successfully Update.');
    }

    public function authorShow($id){
    
        $post  = Post::find($id);
        if($post->user_id != Auth::id()){

            return redirect()->back()->with('msg','You are not authorized to access this Post','error');
        }

    
        return view('author.post.show',compact('post'));
     }


     public function authorDelete($id){

        $post =  Post::find($id);
        if($post->user_id != Auth::id()){

            return redirect()->back()->with('msg','You are not authorized to access this Post','error');
        }
        @unlink(public_path('uploads/category/'.$post->image));

        $post->categories()->detach();
        $post->tags()->detach();

        $post->delete();
     
     return redirect(route('author.post.index'))->with('msg','Post Delete Successfully.');
 }

 ////Notification 


}
