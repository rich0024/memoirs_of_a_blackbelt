class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :start_position
      t.string :type_of_move
      t.string :description
      t.integer :user_id
    end
  end
end
