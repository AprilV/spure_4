class CreateWishlists < ActiveRecord::Migration[5.0]
  def change
    create_table :wishlists do |t|
      t.integer :sneaker_type_id
      t.integer :sneaker_size
      t.integer :user_id

      t.timestamps
    end
    add_index :wishlists, [:user_id , :created_at]
  end
end
