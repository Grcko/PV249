class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :comments, :users, column: :creator_id
    add_foreign_key :tasks, :addresses
    add_foreign_key :tasks, :states
    add_foreign_key :tasks, :users, column: :creator_id
    add_foreign_key :users, :roles
    add_foreign_key :users, :companies
    change_table :sessions do |t|
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
