class EdmundsService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://api.edmunds.com')
  end

  def vin_lookup(vin)
    response = connection.get("/api/vehicle/v2/vins/#{vin}?fmt=json&api_key=#{ENV['EDMUNDS_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

end