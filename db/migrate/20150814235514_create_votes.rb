class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote_count
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
