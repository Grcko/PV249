class DropSessionsTable < ActiveRecord::Migration
  def change
    execute "DROP TABLE SESSIONS"
  end
end
