class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :file_name
      t.string :start_publish
      t.string :end_publish
      t.integer :time_to_air
      t.integer :position
      t.integer :emission_id
      t.timestamps :timestamp
    end
  end
end
