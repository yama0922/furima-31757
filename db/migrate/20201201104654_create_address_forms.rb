class CreateAddressForms < ActiveRecord::Migration[6.0]
  def change
    create_table :address_forms do |t|
      t.string  :postal_code,      null: false
      t.integer :prefecture_id,    null: false   
      t.string  :city,             null: false
      t.string  :address,          null: false
      t.string  :building
      t.string  :phone_number,     null: false
      t.references :buyer,         foreign_key: true  
      t.timestamps
    end
  end
end
