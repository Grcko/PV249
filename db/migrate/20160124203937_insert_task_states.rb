class InsertTaskStates < ActiveRecord::Migration
  def change
    State.create(:id => 1, :name => "New")
    State.create(:id => 2, :name => "Accepted")
    State.create(:id => 3, :name => "In progress")
    State.create(:id => 4, :name => "Completed")
  end
end
