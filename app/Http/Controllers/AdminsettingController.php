<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
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
        $slug   = Str::slug($request->name);
        $user = User::findOrFail(Auth::id());

        if(isset($image)){

            $currentDate  = Carbon::now()->toDateString();
            $imageName = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();
           if(!Storage::disk('public')->exists('profile')){

            Storage::disk('public')->makeDirectory('profile');
           }
           if(Storage::disk('public')->exists('profile/'.$user->image)){

            Storage::disk('public')->delete('profile/'.$user->image);
           }
           $profile = Image::make($image)->resize(500,500)->save();
           Storage::disk('public')->put('profile/'.$imageName,$profile);
           

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
    }
