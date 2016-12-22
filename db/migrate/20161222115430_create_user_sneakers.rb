class CreateUserSneakers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_sneakers do |t|
      t.integer :size
      t.datetime :bought_time
      t.integer :bought_price
      t.integer :sneaker_type_id
      t.integer :user_id

      t.timestamps
    end
    add_index :user_sneakers, [:user_id , :created_at]
  end
end
