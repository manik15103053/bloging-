<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;


    public function user(){
        return $this->belongsTo('App\Models\User');
    }

    public function categories(){
        return $this->belongsToMany(Category::class);
    }
    public function tags(){
        return $this->belongsToMany('App\Models\Tag');
    }
}