class Trade < ActiveRecord::Base
	#Validacion de datos
	#validates :name, :presence=>true, presence: { message: "El campo Nombre no puede estar vacio"}
	validates :name, :uniqueness => true, presence: { message: "El nombre de la empresa debe ser unico"}

	#Dependent al borrar un registro de trade que este asociado con emission lo eliminara
	has_many :emission, :dependent  => :destroy
	
end
