class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :deck_id, index: true
      t.integer :user_id, index: true

      t.timestamps null:false
    end
  end
end
