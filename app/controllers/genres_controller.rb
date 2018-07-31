class GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.order(:name)
  end

  def create
    @genre = Genre.create(genre_params)
    redirect_to genres_path
  end

  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end