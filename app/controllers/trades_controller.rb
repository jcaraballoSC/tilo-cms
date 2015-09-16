class TradesController < ApplicationController
  #Verifica que el usuario este autenticado
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /trades
  # GET /trades.json
  def index
    @title_main = "Lista de empresas"
    @trades = Trade.all
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
    @title_form = "Mostrando:"
    @trade = Trade.find(params[:id])
 
    respond_to do |format|
    format.html  # show.html.erb
    format.json  { render :json => @trade }
    end
  end

  # GET /trades/new
  def new
    @title_create = "Crear nueva empresa"
    @title_form = "Ingrese los datos de la empresa a crear"
    @trade = Trade.new
  end

  # GET /trades/1/edit
  def edit
    @title_main = "Editando empresa"
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(trade_params)

    respond_to do |format|
      if @trade.save
        format.html { redirect_to @trade, notice: 'La empresa fue creada correctamente.' }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { render :new }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to @trade, notice: 'La empresa fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @trade }
      else
        format.html { render :edit }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url, notice: 'La empresa fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:name)
    end
end
