class CreateWeatherNextDaysUys < ActiveRecord::Migration
  def change
    create_table :weather_next_days_uys do |t|
    	t.string :id_up
    	t.string :city
    	t.string :country
    	t.integer :temperature_min
    	t.integer :temperature_max
    	t.string :description
    	t.integer :humidity
    	t.string :icon
    	t.string :pronostic_day
    	t.string :updated
    end
  end
end
