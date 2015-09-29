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
    @upload = Upload.new(post_upload_params)
    @upload.start_publish = params[:upload][:start_publish]
    @upload.end_publish = params[:upload][:end_publish]
    @upload.emission_id = params[:emission_id]
    @upload.time_to_air = '10'

    if @upload.save
      redirect_to :back, notice: 'Los archivos fueron cargados correctamente.'
    else
      render :new
    end
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
