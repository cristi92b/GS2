class HomeController < ApplicationController
  def index
    @songs = Song.all
  end
  def show
  end
  def new
  end
  def create
  end
  def find
    if params[:word].present?
      @songs = Song.where("title like ?", "%#{params[:word]}%")
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
