class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :user_response, null: false
      t.boolean :correct, default: false
      t.integer :attempt, default: 0
      t.integer :card_id, index: true
      t.integer :game_id, index: true

      t.timestamps null:false
    end
  end
end
