class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @title_main = "Lista de usuarios"
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @title_main = "Crear nuevo usuario"
    @title_form = "Ingrese los datos del usuario a crear"
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'El usuario fue creado correctamente.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'El usuario fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'El usuario ha sido eliminado correctamente.' }
      format.json { head :no_content }
    end
  end
  
  def devise_mapping
  @devise_mapping ||= request.env["devise.mapping"]
  end

  #Pagina de permisos de usuario
  def index_permission
    @title_main = "Permisos:"
    @user = User.find(params[:id])
    @emissions = Emission.all
  end

  #Otorga permisos a un usuario para que pueda acceder
  def create_permission
    #Se agrega la relacion en la tabla intermedia
    User.find(params[:user_id]).emissions << Emission.find(params[:emission_id])
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Se le otorgaron permisos al usuario permisos correctamente.' }
      format.json { head :no_content }
    end
  end

  def destroy_permission
    user = User.find(params[:user_id])
    emission = Emission.find(params[:emission_id])
      if emission
        emission.users.delete(user)
      end
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Se eliminaron los permisos correctamente.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name, :phone)
    end
    

end
