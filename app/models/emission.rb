class Emission < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :trade
	has_many :upload, :dependent => :destroy
  has_one :machine, :dependent => :destroy
  has_one :power, :dependent => :destroy
  has_many :statistic, :dependent => :destroy

	#Permite serializar los multiples chechboxes de la opciones news_sources
	serialize :news_source
end
