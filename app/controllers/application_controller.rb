class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_jbuilder_defaults

  #Verifica que el usuario este autenticado
  before_action :authenticate_user!

  #Permite enviar el methodo nav_aux a todas las vistas
  before_filter :nav_side

  def nav_side
    if user_signed_in?
      id_user = current_user.id
      @emisiones_rel = User.find(id_user).emissions      
    end
  end

 def set_jbuilder_defaults
    @errors = []
  end

  def error!(message,status)
    @errors << message
    response.status = status
    render template: "api/v1/errors"
  end

  def error_array!(array,status)
    @errors = @errors + array
    response.status = status
    render "api/v1/errors"
  end

end
