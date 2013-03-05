class User < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true #! Every user must have a name
  has_many :tasks

end
