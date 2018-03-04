class ReviewsController < ApplicationController
  before_filter :authorize, :except => :login
  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_form_params)
    # @review.user_id = current_user.id
    @review.user = current_user
    @review.product_id = @product.id
    puts @review.user_id, @review.product_id, @review.description, @review.rating
    if @review.save
      redirect_to "/products/#{params[:product_id]}"
    else
      redirect_to "/products/#{params[:product_id]}"
    end
    update_rating(params[:product_id])
  end

  def destroy
    Review.find(params[:id]).destroy
    update_rating(params[:product_id])
    redirect_to "/products/#{params[:product_id]}"
  end
  private
  def review_form_params
    params.require(:review).permit(:description, :rating)
  end

  def update_rating(product_id)
    product = Product.find(product_id)
    rough_average = Review.where(product_id: product_id).average(:rating)
    if rough_average.nil?
      product.overall_rating = 0
    else
      product.overall_rating = rough_average.round(0)
    end
    product.save
  end
end
