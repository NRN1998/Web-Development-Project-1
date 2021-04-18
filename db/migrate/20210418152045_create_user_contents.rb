class CreateUserContents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_contents do |t|
      t.string :photos
      t.string :videos
      t.string :caption
      t.integer :owner_id
      t.integer :likes_count
      t.integer :comments_count

      t.timestamps
    end
  end
end
