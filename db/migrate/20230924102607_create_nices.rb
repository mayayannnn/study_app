class CreateNices < ActiveRecord::Migration[7.0]
  def change
    create_table :nices do |t|
      t.string :user_id
      t.string :question_id

      t.timestamps
    end
  end
end
