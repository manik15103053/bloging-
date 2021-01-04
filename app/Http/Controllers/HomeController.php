<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use App\Models\Category;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    ///Admin Dashboard
    public function home(){

        $posts  = Post::all();

        $popular_posts = Post::withCount('comments')
                        ->withCount('favorite_to_users')
                        ->orderBy('view_count','desc')
                        ->orderBy('comments_count','desc')
                        ->orderBy('favorite_to_users_count','desc')
                        ->take(5)->get();
            
        $total_pending_posts = Post::where('is_approved',false)->count();
        $all_views = Post::sum('view_count');
        $author_count = User::where('role_id', 2)->count();
        $new_authors_today  = User::where('role_id', 2)
                                ->whereDate('created_at',Carbon::toDay())->count();

        $active_authors = User::where('role_id', 2)
                                ->withCount('posts')                       
                                ->withCount('comments')                       
                                ->withCount('favorite_posts')
                                ->orderBy('posts_count','desc')                       
                                ->orderBy('comments_count','desc')                       
                                ->orderBy('favorite_posts_count','desc')
                                ->take(5)->get();
        
        $category_count  = Category::all()->count();
        $tag_count       = Tag::all()->count();
        
                        

        return view('admin.dashboard',compact('posts','popular_posts','total_pending_posts','all_views',
        'author_count','new_authors_today','active_authors','category_count','tag_count'));
    } 

    ////Author Dashboard

    public function authorHome(){

        $user = Auth::user();
        $posts = $user->posts;
        $popular_posts = $user->posts()
        ->withCount('comments')
        ->withCount('favorite_to_users')
        ->orderBy('view_count','desc')
        ->orderBy('comments_count')
        ->orderBy('favorite_to_users_count')
        ->take(5)->get();
        //dd($popular_posts);
        $total_pending_posts = $posts->where('is_approved',false)->count();
        $all_views  = $posts->sum('view_count');

        return view('author.dashboard',compact('posts','popular_posts','total_pending_posts','all_views'));
    }

    public function login(){
        return view('admin.login');
    }
    public function loginProcess(Request $request){

        $this->validate($request,[
        
            'email'   =>  'required'
            

        ]);
        $login = $request->only('email', 'password');

        //dd(Auth::attempt($login));

        if (Auth::attempt($login)) {
            $request->session()->regenerate();

            if(auth()->user()->role_id == 1){
                return redirect(route('admin.dashboard'));
            }else{
                return redirect()->back();
            }

            //return redirect()->intended('admin.dashboard');

            ///return redirect(route('admin.dashboard'));
    }else{
        return redirect()->back()->with('msg','Your creditional is invalid');
    }
}

public function logout(){
    Auth::logout();
    
    return redirect(route('registration.form'));
}

//Author Registration
public function registrationForm(){


return view('author.registration');

}

public function registration(Request $request){
    $this->validate($request,[

        'name'   =>   'required',
        'username'   =>   'required',
        'email'   =>   'required',
        'password'   =>   'required',
        'about'   =>   'nullable'
     

    ]);
    $user  = new User();
    $user->name  = $request->name;
    $user->username  = $request->username;
    $user->email  = $request->email;
    $user->password  = bcrypt($request->password);
    $user->about  = $request->about;
    $user->save();
    return redirect()->back()->with('msg','Registration Successfully.');

}
//Author for Login//
public function authorLogin(Request $request){

    $this->validate($request,[
    
        'email'   =>  'required'
        

    ]);
    $login = $request->only('email', 'password');

    //dd(Auth::attempt($login));

    if (Auth::attempt($login)) {

    
        $request->session()->regenerate();

        if(auth()->user()->role_id == 2){
            return redirect(route('author.dashboard'));
        }else{
            return redirect()->back();
        }

        //return redirect()->intended('admin.dashboard');

      
}else{
    return redirect()->back()->with('msg','Your creditional is invalid');
}
}

///Front end 

public function homeIndex(){
    
    $posts = Post::latest()->Approved()->Published()->paginate(9);
    $categories = Category::all();
    return view('master',compact('categories','posts'));
}

}