class AddCurrentStateToComment < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :current_state, :string
    add_column :comments, :previous_state, :string
  end
end
