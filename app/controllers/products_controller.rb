class ProductsController < ApplicationController
  # def initialize
  #   Product.all.each do |product|
  #     rough_average = Review.where(product_id: product.id).average(:rating)
  #     if rough_average.nil?
  #       product.overall_rating = 0
  #     else
  #       product.overall_rating = rough_average.round(0)
  #     end
  #   end
  # end
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = @product.reviews.create
  end

end
