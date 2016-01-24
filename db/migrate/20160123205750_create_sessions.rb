class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :key
      t.text :push_id

      t.timestamps null: false
    end
  end
end
