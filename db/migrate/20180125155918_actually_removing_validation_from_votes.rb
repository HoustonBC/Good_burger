class ActuallyRemovingValidationFromVotes < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:reviews, :vote, true)
  end
end
