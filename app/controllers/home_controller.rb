class HomeController < ApplicationController
  def index
    require "net/http"
    require "json"

    @url = "https://www.airnowapi.org/aq/observation/zipCode/historical/?format=application/json&zipCode=77447&date=2024-12-21T00-0000&distance=50&API_KEY=CCAA2666-38CE-426B-BC5C-3FA17C2F9FBC"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
  end
end
