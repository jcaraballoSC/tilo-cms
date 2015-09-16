class CreateNewsUys < ActiveRecord::Migration
  def change
    create_table :news_uys do |t|
    	t.string :title
    	t.string :description
    	t.string :category
    	t.string :image_url
    	t.string :newspaper
    	t.string :updated
    end
  end
end
