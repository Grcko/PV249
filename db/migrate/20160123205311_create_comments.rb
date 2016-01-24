class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.belongs_to :task, index: true
      t.belongs_to :creator, index: true
      t.timestamps null: false
    end
  end
end
