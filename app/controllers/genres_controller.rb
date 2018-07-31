class GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.order(:name)
  end

  def show
    @genre = Genre.includes(:songs).find(params[:id])
  end
end
