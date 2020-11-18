# README





Users
| Column                | Type   | Options  |
|---------------------  |------- | ---------|
| nick name             | string | not null | 
| email                 | string | not null |
| password              | string | not null |
| password_confirmation | string | not null |
| last_name             | string | not null |
| first_name            | string | not null |
| last_name_kana        | string | not null |
| first_name_kana       | string | not null |
| user_birth_date       | date   | not null |









Items
| Column    | Type       | Options    |
|---------  |-------     |  --------  |
| item_image| string     | not null   |
| category  | text       | not null   |
| sell_price| text       | not null   |
| user      | references |            | 
| items_text| string     | not null   |
| item_info | string     | not null   |
  





Shipping_address_form
| Column      | Type       | Options   |
| -------     | --------   | --------  |
| postal_code | string     |  not null |
| prefecture  | string     |  not null |
| city        | string     |  not null |
| address     | string     |  not null |
| building    | string     |  not null |
| phone_number| string     |  not null |








Shipping_address_form
| Column                | Type       | Options   |
| --------------------  | --------   | --------  |
| buy_item_info         | string     |  not null |
| buy-items_img         | string     |  not null |
| buy_item_price        | string     |  not null |
| credit_card_number    | string     |  not null |
| credit_card_form      | string     |  not null |
| form-text             | text       |  not null |
| input_expiration_month| string     |  not null |
| input_expiration_date | string     |  not null |
| card_exp_date         | string     |  not null |
| card_exp_year         | string     |  not null |
