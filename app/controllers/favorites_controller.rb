class FavoritesController < ApplicationController
  before_action :require_signin, :set_movie

  def create
    @favorite = @movie.favorites.new(user: current_user)
    if @favorite.save
      redirect_to @movie, notice: "You faved that shit!"
    else
      render 'movies/show'
    end
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy
    redirect_to @movie, notice: "Sorry you unfaved it!"
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
