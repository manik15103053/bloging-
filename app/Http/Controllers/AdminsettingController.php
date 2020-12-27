<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;

class AdminsettingController extends Controller
{
    public function settingIndex(){

      return view('admin.setting.setting');
    }

    public function profileUpdate(Request $request){

         //dd($request->all());

        $this->validate($request,[

            'name'    =>   'required',
            'email'    =>   'required|email',
            'image'    =>   'required|required'

        ]);
        $image = $request->file('image');
        $slug  = Str::slug($request->name);
        $user = Auth::user();

        if(isset($image)){

            $currentDate  = Carbon::now()->toDateString();
            $imageName = $slug . '-' . $currentDate . '-' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('profile', $imageName);
            if($user->image != NULL && $user->image != "" && file_exists(public_path('uploads/profile/'.$user->image)))
            unlink(public_path('uploads/profile/'.$user->image));

        } else {
            $imageName  = $user->image;
        }
       
        
        $user->name    = $request->name;
        $user->email    = $request->email;
        $user->image    = $imageName;
        $user->about    = $request->about;
        $user->save();

        return redirect()->back()->with('msg','Profile Successfully Update');
       

        }

        public function passwordUpdate(Request $request){

            //dd($request->all());

            $this->validate($request,[

            'old_password'  =>  'required',
            'password'  =>  'required|confirmed|different:old_password',

            ]);

            $hashedPassword = Auth::user()->password;
            if(Hash::check($request->old_password,$hashedPassword)){
                $user = User::find(Auth::id());

                $user->password = Hash::make($request->password);
                $user->save();
                Auth::logout();

                return redirect()->back();
            }else{
                return redirect()->back()->withErrors('Current Password Not Match');
            }
        }
    }
