class SearchbarController < ApplicationController
  @searchstring
  def index
      @songs = Song.all
  end
  def show
	@song = Song.find(params[:id])
	@path = "/uploads/#{@song.user_id}/#{@song.id}.mp3"
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
end
