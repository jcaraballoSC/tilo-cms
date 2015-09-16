class CreateEmissionsUsers < ActiveRecord::Migration
  def up
  	#Crear la tabla emissions_users sin id
    create_table :emissions_users, :id=>false do |t|
    	t.references :user
    	t.references :emission
  	end
    add_index :emissions_users, :user_id
    add_index :emissions_users, :emission_id
  end
  def down
  	drop_table :emissions_users
  end
end
