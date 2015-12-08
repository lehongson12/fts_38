class AddCorrectToResult < ActiveRecord::Migration
  def change
    add_column :results, :correct, :boolean, default: :false
  end
end
