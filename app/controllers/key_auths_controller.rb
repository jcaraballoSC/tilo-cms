class KeyAuthsController < ApplicationController
  before_action :set_key_auth, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /key_auths
  # GET /key_auths.json
  def index
    @title_main = "Lista de llaves"
    @key_auths = KeyAuth.all
  end

  # GET /key_auths/1
  # GET /key_auths/1.json
  def show
  end

  # GET /key_auths/new
  def new
    @key_auth = KeyAuth.new
  end

  # GET /key_auths/1/edit
  def edit
  end

  # POST /key_auths
  # POST /key_auths.json
  def create
    @key_auth = KeyAuth.new(key_auth_params)

    respond_to do |format|
      if @key_auth.save
        format.html { redirect_to @key_auth, notice: 'Key auth was successfully created.' }
        format.json { render :show, status: :created, location: @key_auth }
      else
        format.html { render :new }
        format.json { render json: @key_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_auths/1
  # PATCH/PUT /key_auths/1.json
  def update
    respond_to do |format|
      if @key_auth.update(key_auth_params)
        format.html { redirect_to @key_auth, notice: 'Key auth was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_auth }
      else
        format.html { render :edit }
        format.json { render json: @key_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_auths/1
  # DELETE /key_auths/1.json
  def destroy
    @key_auth.destroy
    respond_to do |format|
      format.html { redirect_to key_auths_url, notice: 'Key auth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_auth
      @key_auth = KeyAuth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_auth_params
      params[:key_auth]
    end
end
