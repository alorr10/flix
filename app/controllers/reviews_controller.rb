class ReviewsController < ApplicationController
  before_action :find_movie
  before_action :find_review, except: [:index, :create, :new]

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
  end

  def destroy
    @review.destroy
    redirect_to movie_reviews_path(@movie), notice: "Review successfully deleted!"
  end

  def update
    if @review.update(review_params)
      redirect_to @movie, notice: "Review successfully updated!"
    else
      render 'edit'
    end
  end

  private

    def find_movie
      @movie = Movie.find(params[:movie_id])
    end

    def find_review
      @review =  Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:name, :stars, :comment)
    end


end
