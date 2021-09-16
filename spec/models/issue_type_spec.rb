require 'rails_helper'

RSpec.describe IssueType, type: :model do
  it "create correctly" do
    issue = FactoryBot.create(:issue)
    type = FactoryBot.create(:type)
    issue_type = IssueType.create(issue_id: issue.id, type_id: type.id)
    expect(issue_type.type_id).to eq(issue.types.last.id)
  end
end
