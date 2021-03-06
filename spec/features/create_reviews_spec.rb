require 'rails_helper'

RSpec.feature "CreateReviews", type: :feature do
  describe "Creating a new review" do

    before do
      @user = User.create!(user_attributes)
      sign_in(@user)
    end

    it "saves the review" do
      movie = Movie.create(movie_attributes)

      visit movie_url(movie)

      choose "review_stars_3"
      fill_in "Comment", with: "I laughed, I cried, I spilled my popcorn!"

      click_button 'Post Review'

      expect(current_path).to eq(movie_reviews_path(movie))

      expect(page).to have_text("Thanks for your review!")
    end

    it "does not save the review if it's invalid" do
      movie = Movie.create(movie_attributes)

      visit new_movie_review_url(movie)

      expect {
        click_button 'Post Review'
      }.not_to change(Review, :count)

      expect(page).to have_text('error')
    end
  end
end
