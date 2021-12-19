<?php

use Illuminate\Support\Facades\Route;

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


Route::POST('/login', 'App\Http\Controllers\UserController@login');
Route::POST('/register', 'App\Http\Controllers\UserController@register');

Route::POST('/add_posts', 'App\Http\Controllers\PostController@addPosts');
Route::GET('/get_posts/{id}', 'App\Http\Controllers\PostController@getPosts');

Route::POST('/add_follower', 'App\Http\Controllers\FollowerController@addFollower');
Route::POST('/remove_follower', 'App\Http\Controllers\FollowerController@removeFollower');
Route::Get('/follow_list/{id}', 'App\Http\Controllers\FollowerController@getFollowList');
