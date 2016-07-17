class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :answer
      t.integer :round_id, null: false, index: true
      t.integer :card_id, null: false, index: true

      t.timestamps :null, false
    end
  end
end
