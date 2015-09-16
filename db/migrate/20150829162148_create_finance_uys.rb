class CreateFinanceUys < ActiveRecord::Migration
  def change
    create_table :finance_uys do |t|
      t.string :currency
      t.float :buy_now
      t.float :sale_now
      t.string :buy_variatiuon
      t.string :sale_variation
      t.float :buy_yesterday
      t.float :sale_yesterday
      t.string :country
      t.string :updated
    end
  end
end
