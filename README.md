[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)


## Structure

All actions are implemented by the user. In order to add a cheese to a board, a POST request is made to the cheese addition table with the associated board and selected cheese id parameters.

Models:

```ruby
class User < ActiveRecord::Base
  include Authentication
  has_many :boards
end
```

Boards table
-required parameter: name

```ruby
class Board < ActiveRecord::Base
  belongs_to :user, inverse_of: :boards
  has_many :cheese_additions
  has_many :cheeses, through: :cheese_additions
end
```

Cheese table
-loaded via csv

```ruby
class Cheese < ActiveRecord::Base
  has_many :cheese_additions
  has_many :boards, through: :cheese_additions
end
```

Cheese Addition table
-required parameters: board_id, cheese_id
-join table of cheese and board

```ruby
class CheeseAddition < ActiveRecord::Base
  belongs_to :board, inverse_of: :cheese_additions
  belongs_to :cheese, inverse_of: :cheese_additions
end
```

## API



### Authentication

| Verb   | URI Pattern              | Controller#Action        |
|--------|--------------------------|--------------------------|
| POST   | `/sign-up`               | `users#signup`           |
| POST   | `/sign-in`               | `users#signin`           |
| PATCH  | `/change-password/:id`   | `users#changepw`         |
| DELETE | `/sign-out/:id`          | `users#signout`          |
| GET    | `/cheese_additions`      | `cheese_additions#index` |
| POST   | `/cheese_additions `     | `cheese_additions#create`|
| GET    | `/cheese_additions/:id`  | `cheese_additions#show`  |
| PATCH  | `/cheese_additions/:id ` | `cheese_additions#update`|
| PUT    | `/cheese_additions/:id`  |`cheese_additions#update` |
| DELETE | `/cheese_additions/:id`  |`cheese_additions#destroy`|
| GET    | `/cheeses`               | `cheeses#index`          |
| POST   | ` /cheeses`              | `cheeses#create`         |
| GET    | `/cheeses/:id`           | `cheeses#show`           |
| GET    | `/boards`                | `boards#index`           |
| POST   | `/boards`                | `boards#create`          |
| GET    | `/boards/:id`            | `boards#show`            |
| PATCH  | `/boards/:id`            | `boards#update`          |
| PUT    | `/boards/:id`            | `boards#update`          |
| DELETE | `/boards/:id`            | `boards#destroy`         |



#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:3000/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:3000/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:3000/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:3000/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:3000/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```


#### POST /boards

Request:

```sh

curl "http://localhost:3000/boards/$ID" \
  --include \
  --request POST \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data "{
      \"board\" : {
          \"name\" : \"$NAME\",
          \"user_id\" : \"$USER_ID\"
        }
  }"
```

```sh
scripts/boards-create.sh
```


#### PATCH /boards/id

Request:

```sh
curl "http://localhost:3000/boards/$ID" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=$TOKEN" \
  --data "{
      \"board\" : {
          \"name\" : \"$NAME\"
        }
  }"
```

```sh
scripts/board-update.sh
```

#### GET /boards

Request:

```sh
curl --include --request GET http://localhost:3000/boards/ \
  --header "Authorization: Token token=$TOKEN"
  ```

```sh
scripts/boards-get.sh
```


#### GET /boards/id

Request:

```sh
curl --include --request GET http://localhost:3000/boards/$ID \
  --header "Authorization: Token token=$TOKEN"
  ```

```sh
scripts/board-get.sh
```

#### DELETE /boards/id


```sh
curl --include --request DELETE http://localhost:3000/boards/$ID \
  --header "Authorization: Token token=$TOKEN"
```


```sh
scripts/board-delete.sh
```

#### POST /cheese_additions

Request:

```sh

curl --include --request POST http://localhost:3000/cheese_additions \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "cheese_addition": {
      "board_id": "0",
      "cheese_id": "0"
    }
  }'
```

```sh
scripts/cheese_additions-create.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
```

#### DElETE /cheese_additions/:id

Request:

```sh
curl --include --request DELETE http://localhost:3000/cheese_additions/$ID \
  --header "Authorization: Token token=$TOKEN"
```




## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
