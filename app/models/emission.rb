class Emission < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :trade
	has_many :upload, :dependent => :destroy
  	has_one :machine, :dependent => :destroy
  	has_one :power, :dependent => :destroy
  	has_many :statistic, :dependent => :destroy

  	#Antes de guardar llama a la función que genera la llave
  	before_save :converted_to_key
	#Permite serializar los multiples chechboxes de la opciones news_sources
	serialize :news_source

	#Se genera las llaves para las emisiones
	def converted_to_key
		 collect = [self.name, self.trade_id].join("")
    	key_generate = Digest::MD5.hexdigest(collect)
    	self.key = key_generate[0..7]
    end

end
