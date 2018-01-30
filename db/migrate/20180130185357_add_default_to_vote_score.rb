class AddDefaultToVoteScore < ActiveRecord::Migration[5.1]
   def up
     change_column :reviews, :vote_score, :integer, default: 0
   end
   def down
     change_column :reviews, :vote_score, :integer, default: nil
   end
 end
