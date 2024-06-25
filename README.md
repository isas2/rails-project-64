# Коллективный блог

### Hexlet tests and linter status:
[![Actions Status](https://github.com/isas2/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/isas2/rails-project-64/actions)
[![CI](https://github.com/isas2/rails-project-64/actions/workflows/lint-test.yml/badge.svg)](https://github.com/isas2/rails-project-64/actions)

### Развёрнутое приложение
[https://mycorpblog.onrender.com/](https://mycorpblog.onrender.com/).

Коллективный блог - готовый к использованию в вашей организации блог, написанный на Ruby on Rails.

Основные возможности:

* Аутентификация пользователей;
* Публикация и редактирование постов пользователями блога;
* Выбор категории поста при публикации;
* Возможность делать комментарии к постам;
* Возможность отвечать на комментарии и вопросы;
* Поддержка древовидной структуры комментариев;
* Возможность лайкать посты, которые нам понравились.

## Установка зависимостей

```sh
make setup
```

## Запуск тестов

```sh
make test
```

## Запуск проверки синтаксиса

```sh
make lint
make lint-fix
```

## Лицензия

[MIT License](https://opensource.org/licenses/MIT).
