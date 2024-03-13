class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true
      t.boolean :correct
      t.references :round, null: false, foreign_key: true

      t.timestamps
    end
  end
end
