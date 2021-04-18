class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :subscriber_id
      t.integer :creator_id
      t.boolean :active
      t.string :duration
      t.integer :amount

      t.timestamps
    end
  end
end
