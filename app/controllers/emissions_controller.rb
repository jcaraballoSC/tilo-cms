class EmissionsController < ApplicationController
  before_action :set_emission, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

 

  # GET /emissions
  # GET /emissions.json
  def index
    @title_main = "Lista de emisiones"
    @emissions = Emission.all
  end

  # GET /emissions/1
  # GET /emissions/1.json
  def show
    @title_form = "Mostrando:"
  end

  # GET /emissions/new
  def new
    @title_main = "Crear nueva emisión"
    @title_form = "Ingrese los datos de la emisión a crear"
    @trade = Trade.all
    @emission = Emission.new
  end

  # GET /emissions/1/edit
  def edit
    @title_main = "Editando emissión"
  end

  # POST /emissions
  # POST /emissions.json
  def create
    @emission = Emission.new(emission_params)
    @emission.news_source = params[:news_source]

    
    respond_to do |format|
      if @emission.save
        format.html { redirect_to @emission, notice: 'La emisión fue creada correctamente.' }
        format.json { render :show, status: :created, location: @emission }
      else
        format.html { render :new }
        format.json { render json: @emission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emissions/1
  # PATCH/PUT /emissions/1.json
  def update
    respond_to do |format|
      if @emission.update(emission_params)
        format.html { redirect_to @emission, notice: 'La emisión fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @emission }
      else
        format.html { render :edit }
        format.json { render json: @emission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emissions/1
  # DELETE /emissions/1.json
  def destroy
    @emission.destroy
    respond_to do |format|
      format.html { redirect_to emissions_url, notice: 'La emisión fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emission
      @emission = Emission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emission_params
      params.require(:emission).permit(:name,:key,:phone,:address,:country,:state,:city,:email,:template,:content,
        :channel,:send_restart, :football,:color,:path_sponsor,:id_teamviewer, :type_emission, :width, :height, :caller_fullscreen,
        :name_caller_1,:keycode_up_caller_1,:keycode_down_caller_1,
        :name_caller_2,:keycode_up_caller_2,:keycode_down_caller_2,
        :name_caller_3,:keycode_up_caller_3,:keycode_down_caller_3,
        :name_caller_4,:keycode_up_caller_4,:keycode_down_caller_4,
        :name_caller_5,:keycode_up_caller_5,:keycode_down_caller_5,
        :name_caller_6,:keycode_up_caller_6,:keycode_down_caller_6,:trade_id, news_source: [])
    end
end
