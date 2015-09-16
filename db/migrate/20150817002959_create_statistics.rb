class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :date
      t.integer :average_time_turnador_1
      t.integer :average_time_turnador_2
      t.integer :average_time_turnador_3
      t.integer :average_time_turnador_4
      t.integer :average_time_turnador_5
      t.integer :average_time_turnador_6
      t.integer :emission_id
      t.timestamps :timestamp
    end
  end
end
