class Status < ApplicationRecord
  belongs_to :issue
  
  validates_presence_of :name
  
  enum name: [:detected, :remediated, :settled, :closed]
end
