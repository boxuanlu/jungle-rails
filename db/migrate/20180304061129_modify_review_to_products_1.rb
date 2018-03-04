class ModifyReviewToProducts1 < ActiveRecord::Migration
  def change
    remove_column :products, :reviews
    remove_column :products, :rating
    add_column :products, :overall_rating, :integer
  end
end
