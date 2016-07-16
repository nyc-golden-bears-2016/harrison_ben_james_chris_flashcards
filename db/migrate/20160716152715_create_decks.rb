class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title, null: false

    end
  end
end
