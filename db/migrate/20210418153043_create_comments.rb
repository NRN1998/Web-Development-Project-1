class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :commenter_id
      t.integer :content_id

      t.timestamps
    end
  end
end
