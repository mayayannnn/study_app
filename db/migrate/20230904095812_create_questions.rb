class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.text :answer
      t.text :subject
      t.timestamps
    end
  end
end
