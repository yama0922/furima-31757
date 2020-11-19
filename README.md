




## Users table

| Column                | Type   | Options     |
|---------------------  |------- | ---------   |
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
* has_many :address_form





Items
| Column                  | Type       | Options          |
|-----------------------  |---------   | --------         |             
| category_id             | integer    | null :false      |
| price                   | integer    | null :false      |
| user                    | references | foreign_key: true| 
| text                    | text       | null :false      |
| name                    | string     | null :false      |
| sale_status             | integer    | null :false      |
| shipping_fee_status     | integer    | null :false      |
| prefecture_id           | integer    | null :false      |
| scheduled_delivery_id   | integer    | null :false      |


### Association
- belongs_to :user
- has_one :address_form


Address_form
| Column       | Type       | Options                      |
| -------      | --------   | -------------------          |
| postal_code  | string     |  null :false                 | 
| prefecture_id| integer    |  null :false                 |
| city         | string     |  null :false                 |
| address      | string     |  null :false                 |
| building     | integer    |  foreign_key: true           |
| phone_number | string     |  null :false                 |

### Association
- belongs_to :buyer
 





Buyer
| Column                | Type       | Options          |
| --------------------  | --------   | ---------------  |
| item_id               | integer    | foreign_key: true|
| user_id               | integer    | foreign_key: true|
### Association 
- belongs_to :user
- has_one :address_form
- has_one :items