class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.select('*').joins(:user).where("product_id =  #{params[:id]}").order(updated_at: :asc)
    if session[:user_id]
      @my_review = Review.where("product_id = #{params[:id]} and user_id = #{current_user.id}").first
    end
    @new_review = Review.new
  end

end
