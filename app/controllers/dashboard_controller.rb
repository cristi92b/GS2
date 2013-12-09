class DashboardController < ApplicationController
  def index
	@songs = Song.all
  end
  def show
  end
  def new
	@song = Song.new

  end
  def create
	@song=Song.new(params[:song])
	@song.save
	uploader = MusicfileUploader.new
	uploader.store!(params[:song][:musicfile])
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
end
