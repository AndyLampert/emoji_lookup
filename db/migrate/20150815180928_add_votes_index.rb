class AddVotesIndex < ActiveRecord::Migration
  def change
    add_index :votes, :votable_id
  end
end
