<?php

namespace Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Src\Auth\IdentityInterface;


class User extends Model implements IdentityInterface
{
   use HasFactory;

   public $timestamps = false;
   protected $fillable = [
       'fio',
       'email',
       'password',
       'token'
   ];

   protected static function booted()
   {
       static::created(function ($user) {
           $user->password = md5($user->password);
           $user->save();
       });
   }

   //Выборка пользователя по первичному ключу
   public function findIdentity(int $id)
   {
       return self::where('id', $id)->first();
   }

   //Возврат первичного ключа
   public function getId(): int
   {
       return $this->id;
   }

   //Возврат аутентифицированного пользователя
   public function attemptIdentity(array $credentials): User|null
   {
       return self::where(['email' => $credentials['email'],
           'password' => md5($credentials['password'])])->first();
   }
   public function createToken():string        
   {
       $token = md5(time()); 
       $this->token = $token;
       $this->save();

       return $token;
   }
}
