class CreateSneakers < ActiveRecord::Migration[5.0]
  def change
    create_table :sneakers do |t|
      t.string :image
      t.integer :max_size
      t.integer :min_size
      t.integer :history_high
      t.integer :history_low
      t.integer :sneaker_type_id
      t.string :sneaker_name

      t.timestamps
    end
  end
end
