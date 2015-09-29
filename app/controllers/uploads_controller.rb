class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit]

  # GET /uploads
  def index
    @uploads = Upload.where(emission_id: params[:id])
    @upload = Upload.new
    @title_main = "Subir archivos"
    @emission = Emission.find(params[:id])

  end

  # GET /uploads/1
  def show
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  def create
    params[:upload][:name].each do |value|
      @upload = Upload.new(new_upload_params(value))
      return render :new unless @upload.save
    end
    redirect_to :back, notice: 'Los archivos fueron cargados correctamente.'
  end

  # PATCH/PUT /uploads/1
  def update
    params[:upload].each do |value|
      Upload.find(value[:contents_contents]).update(attr_upload(value))
    end
    redirect_to :back, notice: 'Los archivos fueron actualizados correctamente.'
  end

  # DELETE /uploads/1
  def destroy
    Upload.where(id: params[:upload_contents]).destroy_all
    redirect_to :back, notice: 'Los archivos fueron borrados correctamente.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_upload_params
      params.require(:upload).permit(:start_publish, :end_publish, :emission_id, name: [])
    end

    # new params
    def new_upload_params(value)
      {
        start_publish: params[:upload][:start_publish],
        end_publish: params[:upload][:end_publish],
        emission_id: params[:emission_id],
        time_to_air: '10',
        name: value
      }
    end

    # load params upload
    def attr_upload(value)
      {
        position: value[:position],
        start_publish: value[:start_publish],
        end_publish: value[:end_publish],
        time_to_air: value[:time_to_air]
      }
    end
end
