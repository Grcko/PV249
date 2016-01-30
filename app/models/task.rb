class Task < ActiveRecord::Base
  has_many :comments, inverse_of: :task
  belongs_to :address, required: true
  belongs_to :state, required: true
  belongs_to :assignee, :class_name => User
  belongs_to :creator, required: true,:class_name => User, foreign_key: "creator_id", inverse_of: :created_tasks
  belongs_to :assignee, :class_name => User, foreign_key: "assignee_id", inverse_of: :assigned_tasks

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
