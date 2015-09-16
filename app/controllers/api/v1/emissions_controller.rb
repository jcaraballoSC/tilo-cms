class Api::V1::EmissionsController < ApplicationController
  #Desactiva autenticación de devise para la api
	skip_before_filter :authenticate_user!
   skip_before_filter :verify_authenticity_token, :only => :create


  def index
    if get_api_key
      @parse = Array.new
      @news_source = Array.new
      #Trae todos los datos asociados a la llave
      @emission = Emission.where(key: get_api_key)
      #Envío de datos a json 
      @emission.each do |p|
        @weather_now = WeatherNowUy.where(city: p.state)
        @weather_next_days = WeatherNextDaysUy.where(city: p.state)
        @parse << p.news_source
        @uploads = Medium.where(emission_id: p.id)
      end
      @parse.each do |u|
        @news_source = NewsUy.where(newspaper: u)
      end
      @horoscopes = Horoscope.all
    else
      @message = "No autorizado"
    end
end







private
  def get_api_key
      if KeyAuth.exists?(:key_client => request.headers["X-API-CLIENT"],:key_server => request.headers["X-API-SERVER"])
        return request.headers["X-API-SERVER"]
      else
        return false
      end
  end

end



