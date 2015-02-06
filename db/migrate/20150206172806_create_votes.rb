class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.integer :votable_id
      t.string :votable_type
      t.integer :vote_weight
      t.belongs_to :voter
    end
  end
end
