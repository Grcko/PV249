class AddCompanyReferenceToTasks < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.belongs_to :company, index: true, foreign_key: true
    end
  end
end
