class Task < ActiveRecord::Base
  has_many :comments, inverse_of: :task
  belongs_to :address, required: true
  belongs_to :state, required: true
  belongs_to :assignee, :class_name => User
  belongs_to :creator, required: true,:class_name => User, foreign_key: "creator_id", inverse_of: :created_tasks
  belongs_to :assignee, :class_name => User, foreign_key: "assignee_id", inverse_of: :assigned_tasks
  belongs_to :company, required: true
  accepts_nested_attributes_for :address
  before_destroy 'create_deleted_task'
  before_update 'check_reassign'


  def check_reassign
    puts 'Creator'
    puts self.creator
    original = Task.find self.id
    if original.assignee != self.assignee
      # update all comments in order to return them in update for new assignee
      self.comments.each { |comment|
        comment.update(updated_at: DateTime.now)
      }

      # the original task has to be saved to DeletedTask in order to delete it from original user mobile
      # device when request for updates
      if  original.assignee != nil
        DeletedTask.create(task_id: original.id, assignee_id: original.assignee_id)
      end
    end
  end

  def create_deleted_task
    DeletedTask.create(task_id: self.id, assignee_id: self.assignee_id)
  end

end
