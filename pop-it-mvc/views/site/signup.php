<h2>Регистрация нового пользователя</h2>
<pre><?= $message ?? ''; ?></pre>
<form method="post">
   <input name="csrf_token" type="hidden" value="<?= app()->auth::generateCSRF() ?>"/>
   <label>ФИО <input type="text" name="fio"></label>
   <label>Email <input type="text" name="email"></label>
   <label>Пароль <input type="password" name="password"></label>
   <input name="token" type="hidden" value="q"/>
   <button>Зарегистрироваться</button>
</form>

