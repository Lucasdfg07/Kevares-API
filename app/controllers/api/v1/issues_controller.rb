class Api::V1::IssuesController < ApplicationController
  def index
    if params[:latitude].present? && params[:longitude].present?
      begin
        @issues = Issue.within(params[:longitude].to_f, params[:latitude].to_f)
        render 'index.json.jbuilder'
      rescue => exception
        render json: { 'status': 500, message: exception }
      end
    else
      render json: []
    end
  end
end
