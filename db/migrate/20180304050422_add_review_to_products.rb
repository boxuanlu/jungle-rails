class AddReviewToProducts < ActiveRecord::Migration
  def change
    add_column :products, :reviews, :integer
    add_column :products, :rating, :integer
  end
end
