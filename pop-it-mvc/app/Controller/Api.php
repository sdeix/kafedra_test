<?php

namespace Controller;

use Exception;
use Model\Post;
use Src\View;
use Src\Request;
use Model\User;
use Src\Auth\Auth;
use Src\Validator\Validator;
class Api
{
   public function index(): void
   {
       $posts = Post::all()->toArray();

       (new View())->toJSON($posts);
   }

   public function echo(Request $request): void
   {
       (new View())->toJSON($request->all());
   }

   public function signup(Request $request): void
   {
    $validator = new Validator($request->all(), [
        'fio' => ['required'],
        'email' => ['required', 'unique:users,email'],
        'password' => ['required','min:6']
    ], [
        'required' => 'Поле :field пусто',
        'unique' => 'Поле :field должно быть уникально',
        'min'=>'Полe :field должно быть больше 6'
    ]);

    if($validator->fails()){
        (new View())->toJSON(['message' => json_encode($validator->errors(), JSON_UNESCAPED_UNICODE)],422);
     }


    if ($user =User::create($request->all())) {
        $token = $user->createToken();
        (new View())->toJSON(['token'=>$token]);
    }
   }

   public function login(Request $request): void
   {

        if (Auth::attempt($request->all())) {
            $user = Auth::user();
            $token = $user->createToken();
            (new View())->toJSON(['token'=>$token]);
        }
        (new View())->toJSON(['message' => 'Неправильные логин или пароль'],401);
       
    
   }
}
