class DeletedTask < ActiveRecord::Base
  belongs_to :assignee, :class_name => User
end
