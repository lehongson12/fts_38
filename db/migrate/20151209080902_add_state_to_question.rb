class AddStateToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :state, :integer, default: 0
  end
end
