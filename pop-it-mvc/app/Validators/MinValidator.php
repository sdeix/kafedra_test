<?php

namespace Validators;

use Src\Validator\AbstractValidator;

class MinValidator extends AbstractValidator
{

   protected string $message = 'Field :field lenght > :$this->args[0]';

   public function rule(): bool
   {
       return mb_strlen($this->value)>$this->args[0];
   }
}
