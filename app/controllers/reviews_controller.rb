class ReviewsController < ApplicationController

  before_filter :require_login

  def create
    @review = Review.new(review_params)

    if @review.save
      return redirect_to :back, notice: 'Review created!'
    else
      return redirect_to :back, notice: 'Review failed!'
    end
  end

  def destroy
    my_review = Review.find params[:id]
    my_review.destroy
    redirect_to :back, notice: 'Product deleted!'
  end

  private

    def require_login
      unless current_user
        flash[:error]
        redirect_to :login
      end
    end

    def review_params
      params.require(:review).permit(:product_id, :user_id, :description, :rating)
    end
end
