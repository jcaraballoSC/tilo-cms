class Api::V1::EmissionsController < ApplicationController
  #Desactiva autenticación de devise para la api
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :create


  def index
    if key_client_key_server
      @parse = Array.new
      @news_source = Array.new
      #Trae todos los datos asociados a la llave
      @emission = Emission.where(key: key_client_key_server)
      #Envío de datos especificos a json 
      @emission.each do |p|
        @weather_now = WeatherNowUy.where(city: p.state)
        @weather_next_days = WeatherNextDaysUy.where(city: p.state)
        @parse << p.news_source
        @uploads = Upload.where(emission_id: p.id)
        @powers = Power.where(emission_id: p.id)
      end
      @parse.each do |u|
        @news_source = NewsUy.where(newspaper: u)
      end
      @horoscopes = Horoscope.all

    else
      @message = "Unauthorized access"
    end
  end

  def create
      #Parametros que vienen por post con los datos de la llave y el cliente
      @key_client_in = request.headers["X-API-CLIENT"]
      @key_server_in = request.headers["X-API-SERVER"]
      message__exist = "The key already exists"

      #Compruebo si lla llave existe en caso de no existir compruebo por separado 
      #si la llave del cliente existe ya en la tabla y si la del server tambien existe
      #en caso de no existir la inserto en la base de datos previo a evaluar la existencia de la emisión
    if  key_client_key_server
      @message = message__exist
    elsif key_client
      @message = message__exist
    elsif key_server
      @message = message__exist
    else 
      if find_emission(@key_server_in)
        @new_key_auth = KeyAuth.new
        @new_key_auth.key_server = @key_server_in
        @new_key_auth.key_client = @key_client_in
        if @new_key_auth.save
           @message = "Saved successfully"
        else
          @message = "Could not save"
        end
      else
      @message = "The key does not exist"
    end
    end
  end

private
  def key_client_key_server
      if KeyAuth.exists?(:key_client => request.headers["X-API-CLIENT"],:key_server => request.headers["X-API-SERVER"])
        return request.headers["X-API-SERVER"]
      else
        return false
      end
  end

  def key_client
    if KeyAuth.exists?(:key_client => request.headers["X-API-CLIENT"])
      return true
    else
      return false
    end
  end

  def key_server
    if KeyAuth.exists?(:key_server => request.headers["X-API-SERVER"])
      return true
    else
      return false
    end
  end

  def find_emission(value)
    if Emission.exists?(:key => value)
      return true
    else
      return false
    end
  end

end