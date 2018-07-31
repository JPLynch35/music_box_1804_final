class GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.order(:name)
  end
end