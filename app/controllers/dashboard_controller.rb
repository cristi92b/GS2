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
	@song = Song.new(params[:song])
	@song.save
	uploader = MusicfileUploader.new
	uploader.store!(:file)
	#puts uploader
	#puts @song
	#redirect_to dashboard_index_path
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
