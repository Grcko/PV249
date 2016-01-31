class Task < ActiveRecord::Base
  has_many :comments, inverse_of: :task
  belongs_to :address, required: true
  belongs_to :state, required: true
  belongs_to :assignee, :class_name => User
  belongs_to :creator, required: true,:class_name => User, foreign_key: "creator_id", inverse_of: :created_tasks
  belongs_to :assignee, :class_name => User, foreign_key: "assignee_id", inverse_of: :assigned_tasks
  accepts_nested_attributes_for :address
  before_destroy 'create_deleted_task'

  def create_deleted_task
    DeletedTask.create(task_id: self.id, assignee_id: self.assignee_id)
  end

end
