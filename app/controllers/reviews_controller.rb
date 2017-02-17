class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    if @review.save
      return redirect_to :back, notice: 'Review created!'
    else
      return redirect_to :back, notice: 'Review failed!'
    end
  end

  private

    def review_params
      params.require(:review).permit(:product_id, :user_id, :description, :rating)
    end
end
