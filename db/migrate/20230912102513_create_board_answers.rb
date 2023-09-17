class CreateBoardAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :board_answers do |t|
      t.integer :board_id
      t.text :answer
      t.string :user_id
      t.timestamps
    end
  end
end
