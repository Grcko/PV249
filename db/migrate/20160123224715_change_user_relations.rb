class ChangeUserRelations < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :role, index: true
      t.belongs_to :session, index: true
      t.belongs_to :company, index: true
    end
  end
end
