class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, null: false
      t.string :correct_answer, null: false
      t.integer :deck_id, null: false, index: true

      t.timestamps :null, false
    end
  end
end
