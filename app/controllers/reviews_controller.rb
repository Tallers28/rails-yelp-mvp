class ReviewsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.find_by(params[:restaurant_id])
  end

  def new
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
  end
end

private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
