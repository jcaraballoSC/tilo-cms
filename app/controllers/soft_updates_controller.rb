class SoftUpdatesController < ApplicationController
  before_action :set_soft_update, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /soft_updates
  # GET /soft_updates.json
  def index
    @title_main = "Lista de actualizaciones"
    @soft_updates = SoftUpdate.all
  end

  # GET /soft_updates/1
  # GET /soft_updates/1.json
  def show
  end

  # GET /soft_updates/new
  def new
    @title_main = "Subir nueva actualización"
    @soft_update = SoftUpdate.new
  end

  # GET /soft_updates/1/edit
  def edit
  end

  # POST /soft_updates
  # POST /soft_updates.json
  def create
    @soft_update = SoftUpdate.new(soft_update_params)

    respond_to do |format|
      if @soft_update.save
        format.html { redirect_to @soft_update, notice: 'Soft update was successfully created.' }
        format.json { render :show, status: :created, location: @soft_update }
      else
        format.html { render :new }
        format.json { render json: @soft_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soft_updates/1
  # PATCH/PUT /soft_updates/1.json
  def update
    respond_to do |format|
      if @soft_update.update(soft_update_params)
        format.html { redirect_to @soft_update, notice: 'Soft update was successfully updated.' }
        format.json { render :show, status: :ok, location: @soft_update }
      else
        format.html { render :edit }
        format.json { render json: @soft_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soft_updates/1
  # DELETE /soft_updates/1.json
  def destroy
    @soft_update.destroy
    respond_to do |format|
      format.html { redirect_to soft_updates_url, notice: 'Soft update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soft_update
      @soft_update = SoftUpdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soft_update_params
      params.require(:soft_update).permit(:name)
    end
end
