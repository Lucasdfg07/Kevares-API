class Type < ApplicationRecord
  validates_presence_of :name

  has_many :issues
end
