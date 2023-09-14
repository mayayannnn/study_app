class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.text :answer
      t.string :subject
      t.string :grade
      t.string :useer_id
      t.timestamps
    end
  end
end
