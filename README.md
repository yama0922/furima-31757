




## Uses table

| Column                | Type   | Options     |
|---------------------  |------- | ---------   |
| nickname              | string | null :false | 
| nickname              | string | null :false | 
| email                 | string | null :false |
| encrypted_password    | string | null :false |
| last_name             | string | null :false |
| first_name            | string | null :false |
| last_name_kana        | string | null :false |
| first_name_kana       | string | null :false |
| birth_date            | date   | null :false |


### Association
* has_many :items
* has_many :comments





Items
| Column                  | Type       | Options       |
|-----------------------  |---------   | --------      |             
| category_id             | text       | null :false   |
| price                   | integer    | null :false   |
| user                    | references |               | 
| text                    | text       | null :false   |
| info                    | text       | null :false   |
| name                    | text       | null :false   |
| detail                  | text       | null :false   |
| explain                 | text       | null :false   |
| sale_status             | text       | null :false   |
| shipping_fee_status     | text       | null :false   |
| prefecture_id           | text       | null :false   |
| scheduled_delivery      | text       | null :false   |
| add_tax_price           | text       | null :false   |
| profit                  | text       | null :false   |

### Association
- belongs_to :user
- has_many   :comments


Shipping_address_form
| Column       | Type       | Options      |
| -------      | --------   | --------     |
| postal_code  | string     |  null :false |
| prefecture_id| integer    |  null :false |
| city         | string     |  null :false |
| address      | string     |  null :false |
| building     | string     |              |
| phone_number | string     |  null :false |

### Association
- belongs_to :user
 





Trades
| Column                | Type       | Options     |
| --------------------  | --------   | --------    |
| item                  | string     |  null :false|
| user                  | string     |  null :false|
### Association
- belongs_to :user
