class Api::V1::VinSearchController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    vin = params[:search][:vin]
    connection = Faraday.new('https://api.edmunds.com')
    response = connection.get("https://api.edmunds.com/api/vehicle/v2/vins/#{vin}?fmt=json&api_key=#{ENV['EDMUNDS_API_KEY']}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    render partial: 'partials/vin_search_result',
           locals:  { car: parsed_response },
           layout:  false
  end
end
