class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :cpu
      t.string :ram
      t.string :disk
      t.boolean :status_video
      t.integer :emission_id,  null: false
      t.timestamps :timestamp
    end
  end
end
