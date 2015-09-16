class Emission < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :trade
	has_many :medium, :dependent => :destroy
  has_one :machine, :dependent => :destroy
  has_one :power, :dependent => :destroy
  has_many :statistic, :dependent => :destroy

	#Permite serializar los multiples chechboxes de la opciones news_sources
	serialize :news_source
	before_save :converted_to_key
	before_destroy :delete_folder

	#Se genera las llaves para las emisiones
	def converted_to_key
		  collect = [self.name, self.trade_id].join("")
    	key_generate = Digest::MD5.hexdigest(collect)
    	self.key = key_generate[0..7]
    	self.create_folder(key)
    end

    def create_folder(directory_name)
    	#Genero una carpeta asociada a la emisión en la carpeta pública
    	Dir.mkdir(Rails.public_path + 'uploads' + directory_name) unless File.exists?(directory_name)
   	end

   	def delete_folder()
   		directory_name = self.key 
   		FileUtils.remove_dir(Rails.public_path + 'uploads' + directory_name, true)
   	end
end
