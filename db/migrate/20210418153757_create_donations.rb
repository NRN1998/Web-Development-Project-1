class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.integer :donator_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
