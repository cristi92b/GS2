require 'taglib'

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
	@song.user_id=current_user.id #should not be sent from view
	if(params[:song][:musicfile] != nil)
		uploader = MusicfileUploader.new(@song,:musicfile)
        	#uploader.set_userid(current_user.id)
		uploader.store!(params[:song][:musicfile])
		
		TagLib::MPEG::File.open(uploader.url) do |file| #sau @song.musicfile - nu merge deloc, uploader.url merge doar dupa ce fisierul a fost salvat
    			tag = file.id3v2_tag
			@song.title = tag.title
			@song.artist = tag.artist
			@song.album = tag.album
			@song.genre = tag.genre
			@song.year = tag.year
			@song.track = tag.track
		end
		#@song.save
		#uploader.store!(params[:song][:musicfile])
		@song.save
		redirect_to dashboard_index_path
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
        params.require(:song).permit(:title,:artist,:album,:year,:track,:genre,:musicfile)
  end
end
