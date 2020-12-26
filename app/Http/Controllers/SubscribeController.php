<?php

namespace App\Http\Controllers;

use App\Models\Subscribe;
use Illuminate\Http\Request;

class SubscribeController extends Controller
{
    public function userSubscriber(Request $request){
        $this->validate($request,[

            'email'     =>      'required|email|unique:subscribes'
        ]);

        $subscriber  = new Subscribe();
        $subscriber->email  =  $request->email;
        $subscriber->save();
        return redirect()->back()->with('msg','You Successfully added to Subscriber List.');


    }

    public function subscribeList(){

        $subscribers = Subscribe::latest()->get();
        return view('admin.subscribe.index',compact('subscribers'));

    }

    public function subscribeDelete($id){

        Subscribe::find($id)->delete();
        return redirect()->back()->with('msg','Subscriber Successfully Delete.');
    }
}
