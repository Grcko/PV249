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

  def address_street=(string)
    setAddressIfNil
    self.address.street = string
  end

  def address_number=(string)
    setAddressIfNil
    self.address.number = string
  end

  def address_city=(string)
    setAddressIfNil
    self.address.city = string
  end

  def address_country=(string)
    setAddressIfNil
    self.address.country = string
  end

  def assignee_id=(string)
    puts 'asignee id'
    puts string
    self.assignee = User.find(string)
  end


    private

    def setAddressIfNil
      self.address = Address.new if self.address == nil
    end

end
