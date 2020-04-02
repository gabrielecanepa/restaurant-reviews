class ReviewsController < ApplicationController
  before_action :set_restaurant

  # It's a POST request, no need for view! "/restaurants/:restaurant_id/reviews"
  def create
    @review = Review.new(review_params) # params come from a form
    @review.restaurant = @restaurant
    @review.save

    redirect_to restaurant_path(@restaurant.id)
  end

  # It's a DELETE request, no need for view! "/restaurants/:restaurant_id/reviews/:id"
  def destroy
    @review = Review.find(params[:id]) # param comes from route
    @review.destroy

    redirect_to restaurant_path(@restaurant.id)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id]) # param comes from route
  end

  # Only allow a trusted parameter "white list" through.
  def review_params
    params.require(:review).permit(:content)
  end
end
