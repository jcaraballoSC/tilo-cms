class MediaContentsController < ApplicationController
	 before_action :authenticate_user!
	 skip_before_filter :verify_authenticity_token, :only => :create

	def index
	@title_main = "Contenidos"
	@emission = Emission.find(params[:id])
  @media_contents = Medium.where(emission_id: @emission.id)
  end

  def new
    @media = Medium.new
  end
 def create
    @media = Medium.new(uploads_params)
    @media.start_publish = params[:start_publish]
    @media.end_publish = params[:end_publish]
    @media.emission_id = params[:emission_id]
    @media.time_to_air = '10'
    if @media.save!
      respond_to do |format|
        format.json{ render :json => @media }
      end
    end
  end

def delete_media
  Medium.where(id: params[:media_contents]).destroy_all
  redirect_to :back
end
private
  def uploads_params
    params.require(:media).permit(:start_publish, :file)
  end
end


