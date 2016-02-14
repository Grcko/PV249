class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable

  rolify

  has_many :created_tasks, :source => Task, inverse_of: :creator
  has_many :assigned_tasks, :source => Task, inverse_of: :assignee
  belongs_to :company, required: true
  belongs_to :session

  before_create do
    if !self.has_any_role?
      self.add_role :manager
    end
  end

  def company_name=(string)
    self.company = Company.create(name: string)
  end

  def web_name
    if self.name.empty? && self.surname.empty?
      return self.email
    else
      return self.name + ' ' + self.surname
    end
  end
end
