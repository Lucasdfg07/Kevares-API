require 'rails_helper'

RSpec.describe "Issues", type: :request do
  
  describe "GET /api/v1/issues" do
    
		it "returns success status" do
			get '/api/v1/issues'
			expect(response).to have_http_status(200)
		end

		it "return issue on correct latitude and longitude" do
			issue = FactoryBot.create(:issue)
      get "/api/v1/issues?latitude=#{issue.latitude}&longitude=#{issue.longitude}"

      expect(response.body).to include(issue.to_json)
    end
    
    it "return empty array when params are not present" do
			issue = FactoryBot.create(:issue)
      get "/api/v1/issues?latitude=#{FFaker::Geolocation.lat}&longitude=#{FFaker::Geolocation.lng}"

      expect(response.body).to eq([].to_json)
		end
	end
end