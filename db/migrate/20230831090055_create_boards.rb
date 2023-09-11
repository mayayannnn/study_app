class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.text :content
      t.string :subject
      t.string :grade
      t.timestamps
    end
  end
end