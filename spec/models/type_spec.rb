require 'rails_helper'

RSpec.describe Type, type: :model do
  it "create correctly" do
    type = FactoryBot.create(:type)
    expect(type.id).to be > 0
  end
end
