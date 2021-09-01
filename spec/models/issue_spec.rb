require 'rails_helper'

RSpec.describe Issue, type: :model do
    it "returns the lonlat attribute correctly" do
      issue = FactoryBot.build(:issue)
      expect(issue.lonlat.to_s).to include("POINT (#{issue.longitude} #{issue.latitude})")
    end
end