class Api::V1::SoftUpdatesController < ApplicationController
  #Desactiva autenticación de devise para la api
  skip_before_filter :authenticate_user!

  def index
      @updates = SoftUpdate.all
  end
end