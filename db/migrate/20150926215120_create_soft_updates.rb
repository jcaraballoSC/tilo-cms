class CreateSoftUpdates < ActiveRecord::Migration
  def change
    create_table :soft_updates do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
