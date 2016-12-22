class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.datetime :time
      t.text :content
      t.string :title
      t.string :type
      t.string :tag
      t.integer :user_id

      t.timestamps
    end
    add_index :articles, [:user_id , :created_at]
  end
end
