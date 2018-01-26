class RemoveVoteValidation < ActiveRecord::Migration[5.1]
  def change
    change_column :reviews, :vote, :int
  end
end
