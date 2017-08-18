class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @review = Review.new(review_params)
    # @review.restaurant = @restaurant
    @review = @restaurant.reviews.new(review_params)

    if @review.save
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
        format.js # render views/reviews/create.js.erb
      end
    else
      respond_to do |format|
        format.html { render 'restaurants/show' }
        format.js # render views/reviews/create.js.erb
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to @review.restaurant }
      format.js # render views/reviews/destroy.js.erb
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
