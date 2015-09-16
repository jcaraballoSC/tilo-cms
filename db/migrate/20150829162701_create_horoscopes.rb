class CreateHoroscopes < ActiveRecord::Migration
  def change
    create_table :horoscopes do |t|
      t.string :sign
      t.string :description
      t.string :language
      t.string :day
      t.string :updated
    end
  end
end
