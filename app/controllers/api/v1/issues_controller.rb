class Api::V1::IssuesController < ApplicationController
  def index
    if params[:latitude].present? && params[:longitude].present?
      begin
        geolocation = Geocoder.search([params[:latitude].to_f, params[:longitude].to_f])

        data = {
          'issues': Issue.within(params[:longitude].to_f, params[:latitude].to_f),
          'address': geolocation.first.data['error'].nil? ? geolocation.first.data['address'] : {'error': geolocation.first.data['error']}
        }

        render json: data
      rescue => exception
        render json: { 'status': 500, message: exception }
      end
    else
      render json: []
    end
  end
end
