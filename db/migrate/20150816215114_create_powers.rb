class CreatePowers < ActiveRecord::Migration
  def change
    create_table :powers do |t|
      t.integer :day
      t.string :on
      t.string :off
      t.integer :emission_id
      t.timestamps :timestamp
    end
  end
end
