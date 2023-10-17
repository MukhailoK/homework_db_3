Table players {
  player_id integer [primary key]
  username varchar
  email varchar
  password varchar
  rating integer
  registration_date timestamp
}

Table matches {
  match_id integer [primary key]
  player1_id integer
  player2_id integer
  start_time timestamp
  end_time timestamp
  winner_id  integer
}

Table chats {
  chat_id  integer [primary key]
  match_id integer
  player1_id integer
  player2_id integer
}
Table messages {
  message_id  integer [primary key]
  chat_id  integer
  sender_id  integer
  message_text  text [note: 'Content of the message']
  send timestamp

}
Table maps {
  map_id  integer [primary key]
  map_name  varchar
  map_description  text [note: 'Description of the map']
  map_image BLOB
}
Table game{
  game_id integer [primary key]
  map_id  integer
  chat_id  integer
  match_id integer
  player1_id integer
  player2_id integer
}


Ref: "players"."player_id" < "matches"."player1_id"

Ref: "players"."player_id" > "matches"."player2_id"

Ref: "players"."player_id" > "matches"."winner_id"

Ref: "chats"."match_id" > "matches"."match_id"

Ref: "chats"."player1_id" > "players"."player_id"

Ref: "chats"."player2_id" > "players"."player_id"

Ref: "messages"."sender_id" > "players"."player_id"

Ref: "messages"."chat_id" > "chats"."chat_id"

Ref: "game"."map_id" < "maps"."map_id"

Ref: "game"."chat_id" < "chats"."chat_id"

Ref: "game"."match_id" < "matches"."match_id"

Ref: "game"."player1_id" < "players"."player_id"

Ref: "game"."player2_id" < "players"."player_id"