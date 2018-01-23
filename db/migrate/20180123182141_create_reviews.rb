class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.integer :rating, null: false
      t.integer :vote, null: false
      t.text :body
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
