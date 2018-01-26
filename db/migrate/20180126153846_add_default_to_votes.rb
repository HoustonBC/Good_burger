class AddDefaultToVotes < ActiveRecord::Migration[5.1]
  def up
    remove_column :reviews, :vote_score, :integer, null: false
  end
  def down
    add_column :reviews, :vote_score, :integer, default: 0, null: false
  end
end
