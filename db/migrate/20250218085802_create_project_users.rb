class CreateProjectUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :project_users do |t|
      t.integer :project_id
      t.integer :user_id
      t.index [ :project_id, :user_id ]

      t.timestamps
    end
  end
end
