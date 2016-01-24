class Comment < ActiveRecord::Base
  belongs_to :task, required: true, inverse_of: :comments
  belongs_to :creator, required: true, :class_name => User, foreign_key: "creator_id"
end
