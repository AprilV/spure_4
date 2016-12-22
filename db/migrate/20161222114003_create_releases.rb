class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.datetime :time
      t.string :province
      t.string :city
      t.string :shop_name
      t.string :concrete_add
      t.integer :sneaker_type_id
      t.integer :original_retail

      t.timestamps
    end
  end
end
