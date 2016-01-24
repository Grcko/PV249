class InsertRoles < ActiveRecord::Migration
    def self.up
      Role.create(:id => 1, :name => "Manager")
      Role.create(:id => 2, :name => "Worker")
    end
end
