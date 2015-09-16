class DashboardController < ApplicationController
	#Verifica que el usuario este autenticado
	before_action :authenticate_user!

  def index
  end

end
