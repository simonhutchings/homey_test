class AddAasmStateToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :aasm_state, :string
  end
end
