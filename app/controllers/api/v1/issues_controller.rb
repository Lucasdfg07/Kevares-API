class Api::V1::IssuesController < ApplicationController
  def index
    if params[:latitude].present? && params[:longitude].present?
      render json: Issue.within(params[:longitude].to_f, params[:latitude].to_f)
    else
      render json: []
    end
  end
end
