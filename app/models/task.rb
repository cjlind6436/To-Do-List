class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :due, :name, :points, :repeatable, :user_id
  validates :name, :presence => true #! Every task must have a name
  belongs_to :user
  has_many :subtasks

end
