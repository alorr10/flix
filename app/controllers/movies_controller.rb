class MoviesController < ApplicationController

  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  before_action :require_signin, except: [:index, :show]

  before_action :require_admin, except: [:index, :show]

  def index
    @movies = Movie.released
  end

  def show
    @review = @movie.reviews.new
    @fans = @movie.fans
    @current_favorite = current_user.favorites.find_by(movie_id: @movie.id) if current_user
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render 'edit'
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render 'new'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: "Movie successfully deleted!"
  end

private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
