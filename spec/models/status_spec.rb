require 'rails_helper'

RSpec.describe Status, type: :model do
  it "create correctly" do
    issue = FactoryBot.create(:issue)
    status = Status.create(issue_id: issue.id, name: :detected)
    expect(status.id).to eq(issue.status.last.id)
  end
end
