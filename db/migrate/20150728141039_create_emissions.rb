class CreateEmissions < ActiveRecord::Migration
  def change
    create_table :emissions do |t|
      t.string :name
      t.string :key
      t.string :country
      t.string :state
      t.string :city
      t.string :email
      t.integer :template
      t.integer :content
      t.integer :channel
      t.boolean :send_restart
      t.string :news_source
      t.boolean :football
      t.string :color
      t.string :path_sponsor
      t.string :id_teamviewer
      t.string :type_emission
      t.string :width
      t.string :height
      t.boolean :caller_fullscreen
      t.string :name_caller_1
      t.string :keycode_up_caller_1
      t.string :keycode_down_caller_1
      t.string :name_caller_2
      t.string :keycode_up_caller_2
      t.string :keycode_down_caller_2
      t.string :name_caller_3
      t.string :keycode_up_caller_3
      t.string :keycode_down_caller_3
      t.string :name_caller_4
      t.string :keycode_up_caller_4
      t.string :keycode_down_caller_4
      t.string :name_caller_5
      t.string :keycode_up_caller_5
      t.string :keycode_down_caller_5
      t.string :name_caller_6
      t.string :keycode_up_caller_6
      t.string :keycode_down_caller_6
      t.integer :trade_id
      t.timestamps :timestamp
    end
  end
end
