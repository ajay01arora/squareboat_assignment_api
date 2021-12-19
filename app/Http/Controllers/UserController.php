<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use DB;

class UserController extends Controller
{

    public function register(Request $request)
    {   
        $this->validate($request, [
            'name' => 'required',            
            'email'  => 'required',
            'password'  => 'required',
        ]);


        $email = $request->input('email');
        $query = "SELECT * from users where email='$email'";
        $validateUserId = DB::select($query);
        if(count($validateUserId) == 0)
        {
            $user = new User;
            $user->name = $request->input('name');
            $user->password =  $request->input('password');
            $user->email =  $email;
            $user->save();
            $value = array('id' => $user->id, 'name' => $user->name);
            return response()->json(['status' => 200, 'loginSuccess' => true, 'user' => $value]);
        }
        else
        {
            return response()->json(['status' => 400, 'loginSuccess' => false, 'message' => "Email Id already exists."]);
        }
    }

    public function login(Request $request)
    {

        $this->validate($request, [
            'email'  => 'required',
            'password'  => 'required',
        ]);

        $email = $request->input('email');
        $password = $request->input('password');
        $query ="select * from users where email='$email' and password='$password'";
        $result =  DB::select($query);             
        
        if(count($result) > 0)
        {   
            $value = array('id' => $result[0]->id, 'name' => $result[0]->name);
            return response()->json(['status' => 200, 'loginSuccess' => true, 'user' => $value]);            
        }
        else
        {
            return response()->json(['status' => 400, 'loginSuccess' => false, 'message' => "User Id or Password is wrong. Please try again!"]);            
        }
    }

}
