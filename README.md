<p align="center">
  <img src="https://img.shields.io/badge/rails-6.1.3.1-red">
</p>

## 開発環境

### 起動

```
$ docker-compose up -d
```

- ポート

|  ポート  |  用途   |
| ----     |  ----   |
|  23000    | backend |
|  23100    | redoc   |
|  23200   | phpmyadmin |
|  23306   |  mysql   |

## Tips

- Rails command

```
$ docker-compose exec rails_api_backend rails
```

- binding.pryや標準出力の内容を見たい

```
$ docker attach rails_api_backend
```

- Scaffold

```
$ docker-compose exec rails_api_backend rails d scaffold test
```

## Test

```
$ docker-compose up -d [rails_api_backend]
$ docker-compose exec rails_api_backend exec bundle exec rspec
```

### debug

- pry-debugなど対話コンソールを使う場合
- `docker-compose up -d`を実行していることが前提

```
$ docker attach rails_api_backend
```

## OpenApi

docker-compose(全部盛りバージョン)のredocから確認可能です。

- doc/openapi.yaml

## scaffold

- config.generatorで`api: true`を設定している。(管理画面作成する場合などはfalseにする)

### apiの作成

```
$ rails g model DoorTest dynamo_id:string title:string stripe_price_id:string subscription_cost:integer subscription_currency:string post_count:integer member_count:integer suspended:boolean suspended_at:string expires:integer
$ rails g scaffold_controller api/door_test --model-name=DoorTest
```