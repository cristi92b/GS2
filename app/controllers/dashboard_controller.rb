class DashboardController < ApplicationController
  before_filter :authenticate_user!  

  def index
	@songs = Song.all
  end
  def show
  end
  def new
	@song = Song.new

  end
  def create
	#@song=Song.new(params[:song])
	@song=Song.new(create_params)
	#@song.user_id=current_user.id
	if(@song.save && params[:song][:musicfile] != nil)
		uploader = MusicfileUploader.new
		redirect_to dashboard_index_path
		uploader.store!(params[:song][:musicfile])
	else
		redirect_to new_dashboard_path
	end
	#uploader = MusicfileUploader.new
	#uploader.store!(params[:song][:musicfile])
	#redirect_to dashboard_index_path
  end
  def edit
  end
  def update
  end
  def destroy
	@song=Song.find(params[:song][:id])
	if( @song.present? )
		@song.destroy
	end
	redirect_to dashboard_index_path
  end
  private
  def create_params
        params.require(:song).permit(:title,:artist,:album,:musicfile,:user_id)
  end
end