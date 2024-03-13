class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :description
      t.references :category, null: false, foreign_key: true
      t.string :correct_answer

      t.timestamps
    end
  end
end
