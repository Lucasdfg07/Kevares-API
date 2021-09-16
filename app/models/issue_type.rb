class IssueType < ApplicationRecord
  belongs_to :issue
  belongs_to :type
end
