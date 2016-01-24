class Task < ActiveRecord::Base
  has_many :comments, inverse_of: :task
  belongs_to :address, required: true
  belongs_to :state, required: true
  belongs_to :assignee, :class_name => User
  belongs_to :creator, required: true,:class_name => User, foreign_key: "creator_id", inverse_of: :created_tasks
  belongs_to :assignee, :class_name => User, foreign_key: "assignee_id", inverse_of: :assigned_tasks
end
