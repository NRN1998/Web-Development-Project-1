class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :profile_image
      t.boolean :creator
      t.integer :follow_requests_count
      t.integer :user_contents_count
      t.integer :subscriptions_count
      t.integer :subscribers_count
      t.integer :given_donations_count

      t.timestamps
    end
  end
end
