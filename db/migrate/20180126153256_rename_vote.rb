class RenameVote < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :vote, :vote_score
  end
end
