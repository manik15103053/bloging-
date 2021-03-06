<?php
namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;
use GuzzleHttp\Psr7\Request;
use Illuminate\Support\Facades\Route;
use NunoMaduro\Collision\Contracts\Highlighter;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/////// Admin Login

Route::get('/login',[HomeController::class,'login'])->name('login');
Route::post('login/process',[HomeController::class,'loginProcess'])->name('login.process');
//end Login////
Route::get('/',[HomeController::class,'homeIndex'])->name('home');
//All Post Route
Route::get('/all/post',[PostdetailsController::class,'allPost'])->name('allPost.index');
///Post Details 
Route::get('/post/details/{slug}',[PostdetailsController::class,'postDetails'])->name('post.details');
Route::get('/post_category/{slug}',[PostController::class,'postByCategory'])->name('category.post');
Route::get('/post_by_tag/{slug}',[PostController::class,'postByTag'])->name('tag.post');

///Authro Profiles

Route::get('/author/profile/{username}',[AuthorprofileController::class,'profile'])->name('author.profile');
///User Subscriber
Route::post('/user/subscriber',[SubscribeController::class,'userSubscriber'])->name('user.subscriber');

///Search Route

Route::get('/search',[SearchController::class,'searchIndex'])->name('search');

///Route for favorite Post
Route::group(['middleware' => ['auth']], function(){

Route::get('/favorite/{id}/add',[favoriteController::class,'add'])->name('post.favorite');
Route::post('store//comment/{post}',[CommentController::class,'comment'])->name('comment.store');

});


Route::group(['middleware' => 'auth'], function(){

Route::get('/admin/dashboard',[HomeController::class,'home'])->name('admin.dashboard');

Route::get('/admin/setting',[AdminsettingController::class,'settingIndex'])->name('admin.setting');
Route::post('/profile/update',[AdminsettingController::class,'profileUpdate'])->name('profile.update');
Route::post('/password/update',[AdminsettingController::class,'passwordUpdate'])->name('password.update');



///Admin Logout
Route::get('/logout',[HomeController::class,'logout'])->name('logout');
///end Logout

//Tag Route....
Route::get('admin/tag',[TagController::class,'index'])->name('admin.tag');
Route::get('tag/create',[TagController::class,'create'])->name('tag.create');
Route::post('tag/store',[TagController::class,'store'])->name('tag.store');
Route::get('/edit/tag/{id}',[TagController::class,'edit'])->name('edit.tag');
Route::post('/update/tag/{id}',[TagController::class,'update'])->name('update.tag');
Route::get('delete/tag/{id}',[TagController::class,'destroy'])->name('delete.tag');
//End Tag Route..

//Route for Category......
Route::get('/admin/category',[CategoryController::class,'categoryIndex'])->name('admin.category');
Route::get('/category/create',[CategoryController::class,'categoryCreate'])->name('category.create');
Route::post('/category/store',[CategoryController::class,'categoryStore'])->name('category.store');
Route::get('/category/edit{id}',[CategoryController::class,'categoryEdit'])->name('category.edit');
Route::post('/category/update/{id}',[CategoryController::class,'categoryUpdate'])->name('category.update');
Route::get('category/delete/{id}',[CategoryController::class,'categoryDelete'])->name('category.delete');

//Route For Post........

Route::get('/post/index',[PostController::class,'postIndex'])->name('post.index');
Route::get('/create/post',[PostController::class,'createPost'])->name('create.post');
Route::post('/post/store',[PostController::class,'postStore'])->name('post.store');
Route::get('/post/edit/{id}',[PostController::class,'postEdit'])->name('post.edit');
Route::post('/post/update/{id}',[PostController::class,'postUpdate'])->name('post.update');
Route::get('/post/show/{id}',[PostController::class,'postShow'])->name('post.show');

Route::get('/post/delete/{id}',[PostController::class,'postDelete'])->name('post.delete');

Route::get('post/pending',[PostController::class,'postPending'])->name('post.pending');
Route::get('/post/approve/{id}',[PostController::class,'postApprove'])->name('post.approve');

///Favorate Route
Route::get('/admin/favorite/list',[AdminfavoriteController::class,'favorateIndex'])->name('admin.favorate');
//Route::get('/admin/favorite/delete/{id}',[AdminfavoriteController::class,'favoriteDelete'])->name('favorite.delete');

Route::get('/author/list',[AuthorController::class,'authorList'])->name('author.list');
Route::get('/author/delete/{id}',[AuthorController::class,'authorDelete'])->name('author.delete');
//Admin Comment List
Route::get('/admin/comment/list',[CommentController::class,'adminComment'])->name('admin.comment');
Route::get('/admin/comment/delete/{id}',[CommentController::class,'admincommentDelete'])->name('admin.comment.delete');
Route::get('/subscribe/list',[SubscribeController::class,'subscribeList'])->name('subscribt.list');
Route::get('/subscribe/delete/{id}',[SubscribeController::class,'subscribeDelete'])->name('subscribe.delete');
});





///Route for Author Registration////
Route::get('/registration/form',[HomeController::class,'registrationForm'])->name('registration.form');

Route::post('/registration',[HomeController::class,'registration'])->name('registration');
//Route for Author Login//
Route::post('author/login',[HomeController::class,'authorLogin'])->name('author.login');






Route::group(['middleware' => 'auth'], function(){

 Route::get('/author/dashboard',[HomeController::class,'authorHome'])->name('author.dashboard');

Route::get('/author/setting',[AuthorsettingController::class,'authorsettingIndex'])->name('author.setting');
Route::post('/author/profile/update',[AuthorsettingController::class,'authorprofileUpdate'])->name('author.profile.update');
Route::post('/author/password/update',[AuthorsettingController::class,'authorpasswordUpdate'])->name('author.password.update');
Route::get('/author/favorite/list',[AuthorfavoriteController::class,'authorfavoriteIndex'])->name('author.favorate');

///Author Comment list
Route::get('/author/comment/list',[CommentController::class,'auhtorComment'])->name('author.comment');
Route::get('/autor/comment/delete/{id}',[CommentController::class,'authorcommentDelete'])->name('author.comment.delete');



 Route::get('/author/post/index',[AuthorpostController::class,'authorIndex'])->name('author.post.index');
 Route::get('/author/post/create',[AuthorpostController::class,'authorCreate'])->name('author.post.create');
 Route::post('/author/post/store',[AuthorpostController::class,'authorStore'])->name('author.post.store');
 Route::get('/author/post/edit/{id}',[AuthorpostController::class,'authorEdit'])->name('author.post.edit');
 Route::post('/author/post/update/{id}',[AuthorpostController::class,'authorUpdate'])->name('author.post.update');
 Route::get('/author/post/show/{id}',[AuthorpostController::class,'authorShow'])->name('author.post.show');
 Route::get('/author/post/delete/{id}',[AuthorpostController::class,'authorDelete'])->name('author.post.delete');


});









