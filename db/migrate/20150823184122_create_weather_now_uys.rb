class CreateWeatherNowUys < ActiveRecord::Migration
  def change
    create_table :weather_now_uys do |t|
      t.string :city
      t.string :country
      t.integer :temperature
      t.string :description
      t.integer :humidity
      t.string :icon
      t.integer :wind
      t.integer :pressure
      t.string :updated
    end
  end
end
