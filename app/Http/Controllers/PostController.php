<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Posts;
use DB;

class PostController extends Controller
{

     /**pos
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function addPosts(Request $request)
    {   
        $this->validate($request, [         
            'post_content'  => 'required',
            'added_by'  => 'required',
        ]);
        $post = new Posts;
        $post->post_content =  $request->input('post_content');
        $post->added_by =  $request->input('added_by');        
        $post->save();
        return response()->json(['status' => 200, 'post' => $post]);    
    }

    public function getPosts($id)
    { 
        $query = "SELECT u.name, p.post_content, p.created_at FROM `posts` p join followers f 
                    on p.added_by=f.follower_id 
                    join users u
                    on u.id=p.added_by
                    where f.user_id=$id or p.added_by=$id
                    order by p.id desc";
        $list = DB::select($query);
        return response()->json(['status' => 200, 'posts' => $list]);
    }
}
