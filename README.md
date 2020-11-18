# README




## Uses table

| Column                | Type   | Options  |
|---------------------  |------- | ---------|
| nick_name             | string | not null | 
| e_mail                | string | not null |
| encrypted_password    | string | not null |
| last_name             | string | not null |
| first_name            | string | not null |
| last_name_kana        | string | not null |
| first_name_kana       | string | not null |
| birth_date            | date   | not null |


### Association
* has_many :items






Items
| Column                  | Type       | Options    |
|-----------------------  |---------   | --------   |
| item_image              | string     | not null   |
| category                | text       | not null   |
| item_price              | text       | not null   |
| user                    | references |            | 
| items_text              | string     | not null   |
| item_info               | string     | not null   |
| item_name               | string     | not null   |
| item_detail             | string     | not null   |
| items_explain           | string     | not null   |
| item_sale_status        | string     | not null   |
| item_shipping_fee_status| string     | not null   |
| item_prefecture         | string     | not null   |
| item-scheduled_delivery | string     | not null   |
| add_tax_price           | string     | not null   |
| profit                  | string     | not null   |

### Association
- belongs_to :user



Shipping_address_form
| Column       | Type       | Options   |
| -------      | --------   | --------  |
| postal_code  | string     |  not null |
| prefecture_id| integer    |  not null |
| city         | string     |  not null |
| address      | string     |  not null |
| building     | string     |           |
| phone_number | string     |  not null |








Trades
| Column                | Type       | Options   |
| --------------------  | --------   | --------  |
