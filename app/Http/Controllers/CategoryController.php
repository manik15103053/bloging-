<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Auth\Events\Validated;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;

class CategoryController extends Controller
{
    //Category show Operation
    public function  categoryIndex()
    {

        $categorys = Category::latest()->get();
        return view('admin.category.index', compact('categorys'));
    }

    public function categoryCreate()
    {
        return view('admin.category.create');
    }
    //Category Create Operation
    public function categoryStore(Request $request)
    {

        $this->validate($request, [

            'name'  => 'required:unique:categories',
            'image'  =>  'required|mimes:png,jpg,jpeg'

        ]);

        $image = $request->file('image');

        $slug = Str::slug($request->name);

        if ($request->hasFile('image')) {
            $currentDate = Carbon::now()->toDateString();

            $imagename = $slug . '-' . $currentDate . '-' . uniqid() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('category', $imagename);
        } else {
            $imagename  = "default.png";
        }
        $category = new Category();
        $category->name = $request->name;
        $category->slug = $slug;
        $category->image = $imagename;
        $category->save();

        return redirect(route('admin.category'))->with('msg', 'Category Successfully Save');
    }

    public function categoryEdit($id)
    {

        $category = Category::find($id);
        return view('admin.category.edit', compact('category'));
    }
        //Category Update Operation
    public function categoryUpdate(Request $request, $id)
    {

        $this->validate($request, [

            'name'  => 'required',
            'image'  =>  'mimes:png,jpg,jpeg'

        ]);
        $category =  Category::find($id);

        $old_file_name = $category->image;

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
       
        $category->name = $request->name;
        $category->slug = $slug;
        $category->image = $imagename;
        $category->save();

        return redirect(route('admin.category'))->with('msg', 'Category Successfully Update');
    }
    //Category Delete Operation
    public function categoryDelete($id){

           $category =Category::find($id);
           @unlink(public_path('uploads/category/'.$category->image));

           $category->delete();
        
        return redirect(route('admin.category'))->with('msg','Category Delete Successfully.');
    }
}
