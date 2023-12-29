<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class favoriteController extends Controller
{
    public function add($id){

       $user  = Auth::user();

       $isFavorite = $user->favorite_posts()->where('post_id',$id)->count();

       if($isFavorite  == 0){

        $user->favorite_posts()->attach($id);
        return redirect()->back()->with('success', 'Favorite Post added successfully!');
       }else{

        $user->favorite_posts()->detach($id);
        return redirect()->back()->with('error', 'Favorite Post remove successfully!');

       }
    }
}
