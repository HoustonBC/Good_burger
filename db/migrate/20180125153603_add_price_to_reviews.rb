class AddPriceToReviews < ActiveRecord::Migration[5.1]
  def change
      add_column :reviews, :price, :int, null: false
  end
end
