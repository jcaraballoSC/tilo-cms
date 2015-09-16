class CreateKeyAuths < ActiveRecord::Migration
  def change
    create_table :key_auths do |t|
      t.string :key_server, :uniqueness => true
      t.string :key_client
      t.string :key_status
      t.timestamps :timestamp
    end
  end
end
