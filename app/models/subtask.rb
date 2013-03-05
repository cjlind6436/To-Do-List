class Subtask < ActiveRecord::Base
  attr_accessible :completed, :description, :name, :repeatable, :task_id, :user_id
  validates :name, :presence => true #! Every subtask must have a name
  belongs_to :task
end
