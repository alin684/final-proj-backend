class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :poster_id
      t.integer :receiver_id

      t.timestamps

      t.references :poster
      t.references :receiver
    end

    add_foreign_key :posts, :users, column: :poster_id, primary_key: :id
    add_foreign_key :posts, :users, column: :receiver_id, primary_key: :id
  end
end
