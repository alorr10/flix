class ReviewsController < ApplicationController
  before_action :find_movie, only: [:index, :new, :create]

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
    render 'new'
  end

  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_reviews_path(@movie), notice: "Thanks for your review!"
    else
      render 'new'
    end
  end

  def edit
    @review = @movie.reviews.find(params[:movie_id][:id])
  end

  private

    def find_movie
      @movie = Movie.find(params[:movie_id])
    end

    def review_params
      params.require(:review).permit(:name, :stars, :comment)
    end


end
