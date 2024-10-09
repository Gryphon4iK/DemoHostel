-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Окт 09 2024 г., 11:49
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `HostelDB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Orders`
--

CREATE TABLE `Orders` (
  `id` int NOT NULL,
  `room_id` int NOT NULL,
  `user_id` int NOT NULL,
  `start_at` date NOT NULL,
  `end_at` date NOT NULL,
  `payment_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Payment`
--

CREATE TABLE `Payment` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `date` date NOT NULL,
  `status` int NOT NULL,
  `sum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Room`
--

CREATE TABLE `Room` (
  `id` int NOT NULL,
  `number` int NOT NULL,
  `floor` int NOT NULL,
  `category` varchar(255) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Room`
--

INSERT INTO `Room` (`id`, `number`, `floor`, `category`, `status`) VALUES
(1, 101, 1, 'Одноместный стандарт', 1),
(2, 102, 1, 'Одноместный стандарт', 1),
(3, 103, 1, 'Одноместный эконом', 1),
(4, 104, 1, 'Одноместный эконом', 1),
(5, 105, 1, 'Стандарт двухместный с 2 раздельными кроватями', 1),
(6, 106, 1, 'Стандарт двухместный с 2 раздельными кроватями', 1),
(7, 107, 1, 'Эконом двухместный с 2 раздельными кроватями', 1),
(8, 108, 1, 'Эконом двухместный с 2 раздельными кроватями', 1),
(9, 109, 1, '3-местный бюджет', 1),
(10, 110, 1, '3-местный бюджет', 1),
(11, 201, 2, 'Бизнес с 1 или 2 кроватями', 1),
(12, 202, 2, 'Бизнес с 1 или 2 кроватями', 1),
(13, 203, 2, 'Бизнес с 1 или 2 кроватями', 1),
(14, 204, 2, 'Двухкомнатный двухместный стандарт с 1 или 2 кроватями', 1),
(15, 205, 2, 'Двухкомнатный двухместный стандарт с 1 или 2 кроватями', 1),
(16, 206, 2, 'Двухкомнатный двухместный стандарт с 1 или 2 кроватями', 1),
(17, 207, 2, 'Одноместный стандарт\r\n', 1),
(18, 208, 2, 'Одноместный стандарт', 1),
(19, 209, 2, 'Одноместный стандарт', 1),
(20, 301, 3, 'Студия', 1),
(21, 302, 3, 'Студия', 1),
(22, 303, 3, 'Студия', 1),
(23, 304, 3, 'Люкс с 2 двуспальными кроватями', 1),
(24, 305, 3, 'Люкс с 2 двуспальными кроватями', 1),
(25, 306, 3, 'Люкс с 2 двуспальными кроватями', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Task`
--

CREATE TABLE `Task` (
  `user_id` int NOT NULL,
  `room_id` int NOT NULL,
  `client_message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE `User` (
  `id` int NOT NULL,
  `role` int NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `middle_name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `Task`
--
ALTER TABLE `Task`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Индексы таблицы `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Payment`
--
ALTER TABLE `Payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Room`
--
ALTER TABLE `Room`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `User`
--
ALTER TABLE `User`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `Room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Orders` (`payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Task`
--
ALTER TABLE `Task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `Room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
