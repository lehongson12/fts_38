class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :correct_number
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
