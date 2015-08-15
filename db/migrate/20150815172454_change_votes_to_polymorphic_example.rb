class ChangeVotesToPolymorphicExample < ActiveRecord::Migration
  # what you want to add
  def up
    add_column :votes, :votable_id, :integer
    add_column :votes, :votable_type, :string
    add_column :votes, :type, :string
    remove_column :votes, :vote_count
    remove_column :votes, :comment_id
  end
end
