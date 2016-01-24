class DropRole < ActiveRecord::Migration
  def change
    remove_column :users, :role_id
    drop_table :roles
  end
end
