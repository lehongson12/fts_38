class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :answers, :category_id, :question_id
  end
end
