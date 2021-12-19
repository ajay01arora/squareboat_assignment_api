<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Follower;
use DB;

class FollowerController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function addFollower(Request $request)
    {   
        $this->validate($request, [
            'user_id' => 'required',            
            'follow_id'  => 'required'
        ]);

        $follower = new Follower;
        $follower->user_id = $request->input('user_id');
        $follower->follower_id =  $request->input('follow_id');
        $follower->save();
        return response()->json(['status' => 200]);    
    
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getFollowList($id)
    {   
        $query = "SELECT u.id, u.name FROM `users` u join followers f on u.id=f.follower_id where f.user_id=$id";
        $following_list =  DB::select($query);

        $query = "SELECT u.id, u.name FROM `users` u WHERE u.id in (SELECT user_id from followers WHERE follower_id=$id)";
        $follower_list =  DB::select($query);

        $query = "SELECT u.id, u.name FROM `users` u WHERE u.id != $id and u.id not in (select follower_id from followers where user_id=$id)";
        $can_follow_list =  DB::select($query);

        return response()->json(['status' => 200, 'can_follow_list' => $can_follow_list,'following_list' => $following_list, 'follower_list' => $follower_list]);
            
    }

        /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function removeFollower(Request $request)
    {   
        $this->validate($request, [
            'user_id' => 'required',            
            'follow_id'  => 'required'
        ]);
        
        $user_id = $request->input('user_id');
        $follow_id =  $request->input('follow_id');
        $query = "delete from followers where user_id=$user_id and follower_id=$follow_id";
        DB::select($query);
        return response()->json(['status' => 200]);    
    }
}
