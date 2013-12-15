class SearchbarController < ApplicationController
  @searchstring
  def index
      @songs = Song.all
  end
  def show
	@song = Song.find(params[:id])
	@path = "/uploads/#{@song.user_id}/#{@song.id}.mp3"
	@comm = Comment.new
  end
  def new

  end
  def create
     if params[:searchstring].present?
      @songs = Song.where("title like ?", "%#{params[:searchstring]}%")
      @searchstring = params[:searchstring]
    else
      @songs = Song.all
    end
  end
  def edit

  end
  def update

  end
  def destroy

  end
  def save_comm
  	@comm = Comment.new()
 	@comm.content = params[:comment][:content]
	@comm.user_id = current_user.id
	@comm.song_id = params[:song_id]
	@comm.save
	redirect_to searchbar_path(params[:song_id])
  end
end
