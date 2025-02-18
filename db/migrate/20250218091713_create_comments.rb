class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.integer :parent_id
      t.string :parent_type
      t.integer :user_id

      t.timestamps
    end
  end
end
