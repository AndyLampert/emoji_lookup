class AddUserIdToVote < ActiveRecord::Migration
  def change
    add_column :votes, :user_id, :integer
    add_index :votes, :user_id
    # adding index makes it faster, but the lookup takes longer??
  end
end
