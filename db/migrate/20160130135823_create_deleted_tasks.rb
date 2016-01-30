class CreateDeletedTasks < ActiveRecord::Migration
  def change
    create_table :deleted_tasks do |t|
      t.integer :task_id
      t.belongs_to :assignee, index: true, add_foreign_key: true
      t.timestamps null: false
    end
  end
end
