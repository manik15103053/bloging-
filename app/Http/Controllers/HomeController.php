<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function home(){
        return view('admin.dashboard');
    } 

    public function authorHome(){

        return view('author.dashboard');
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
    
    return redirect(route('login'));
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
    
    $posts = Post::latest()->take(6)->get();
    $categories = Category::all();
    return view('master',compact('categories','posts'));
}

}