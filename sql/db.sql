-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Ноя 12 2024 г., 23:12
-- Версия сервера: 10.7.8-MariaDB-1:10.7.8+maria~ubu2004
-- Версия PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
USE db;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`) VALUES
(1, 'name1', 'description1', 4525),
(2, 'name2', 'description2', 12);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `fio`, `email`, `password`, `token`) VALUES
(1, 'qwe', 'qwe', '76d80224611fc919a5d54f0ff9fba446', 'q'),
(2, 'dfg', 'dfg', '38d7355701b6f3760ee49852904319c1', 'q'),
(3, 'tyu', 'tyu', 'af27bab84283536c346b97ced4bc5c58', 'q'),
(4, 'hjkhjk', 'hjkhjk', 'f577637390953952cba4fa88a801169d', 'q'),
(5, 'qwe', 'we', '76d66c5a5356104a8fc6784e007d9c33', '28908e1d97438ece5109ea7104a11a24'),
(6, 'asdasd', 'asdasdas', 'a3dcb4d229de6fde0db5686dee47145d', NULL),
(7, 'qwdqwd', 'dqwdqw', 'e473f7209f4e403573b8ef5bf9f5df22', NULL),
(8, 'asdqw', 'qwdawd', '255ec47737adb8de877db6f72d9dcce7', NULL),
(9, 'qwe', 'weqwd', '76d66c5a5356104a8fc6784e007d9c33', 'be48b20c0fa296c47445b563a3c2eeb3'),
(10, 'qwe', 'weq', 'a5f78a5b1f0e1a0887b862b22be4f93e', '135e8488cc480467ffdb71c91097354a');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
