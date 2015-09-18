class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :tipe
      t.string :home
      t.string :score_home
      t.string :logo_home
      t.string :visitor
      t.string :score_visitor
      t.string :logo_visitor
      t.string :status
      t.string :time
      t.string :date
      t.string :show
      t.string :url
      t.timestamps null: false
    end
  end
end
