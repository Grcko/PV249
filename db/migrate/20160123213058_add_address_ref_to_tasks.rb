class AddAddressRefToTasks < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.datetime :time
      t.belongs_to :address, index: true
      t.belongs_to :state, index: true
      t.belongs_to :creator, index: true
      t.belongs_to :assignee, index: true
    end
  end
end
