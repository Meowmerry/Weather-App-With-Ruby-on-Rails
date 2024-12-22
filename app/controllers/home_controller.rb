class HomeController < ApplicationController
  def index
    require "net/http"
    require "json"

    @zipCode = 77447 # 89129
    @url = "https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=#{@zipCode}&distance=50&API_KEY=CCAA2666-38CE-426B-BC5C-3FA17C2F9FBC"
    @uri = URI(@url)

    begin
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)

      # Check if the output is empty and if it is, set the final output to "Error"
      if @output.empty? || @output[0]["AQI"].nil?
        @final_output = "Error"
      elsif !@output
        @final_output = "Error"
      else
        @final_output = @output[0]["AQI"].to_i
      end

    rescue => e
      Rails.logger.error "API Fetch Error: #{e.message}"
      @final_output = "Error"
    end

      if @final_output == "Error"
          @api_color = "gray-bg"
      elsif @final_output <= 50
          @api_color = "green-bg"
          @api_description = "Air quality is considered satisfactory, and air pollution poses little or no risk."
      elsif @final_output >= 51 && @final_output <= 100
          @api_color = "yellow-bg"
          @api_description = "Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution."
      elsif @final_output >= 101 && @final_output <= 150
          @api_color = "orange-bg"
          @api_description = "Members of sensitive groups may experience health effects. The general public is not likely to be affected."
      elsif @final_output >= 151 && @final_output <= 200
          @api_color = "red-bg"
          @api_description = "Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects."
      elsif @final_output >= 201 && @final_output <= 300
          @api_color = "purple-bg"
          @api_description = "Health alert: everyone may experience more serious health effects."
      elsif @final_output >= 301
          @api_color = "maroon-bg"
          @api_description = "Health warnings of emergency conditions. The entire population is more likely to be affected."
      else
          @api_color = "gray-bg"
      end
  end

  def zipcode
    @zip_query = params[:zipcode]
      # if params[:zipcode] == ""
      #   @zip_query = "Hey you forgot to enter a zipcode!"
      # elsif params[:zipcode]
      require "net/http"
      require "json"

      @url = "https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=#{@zip_query}&distance=50&API_KEY=CCAA2666-38CE-426B-BC5C-3FA17C2F9FBC"
      @uri = URI(@url)

      begin
        @response = Net::HTTP.get(@uri)
        @output = JSON.parse(@response)

        # Check if the output is empty and if it is, set the final output to "Error"
        if @output.empty? || @output[0]["AQI"].nil?
          @final_output = "Error"
        elsif !@output
          @final_output = "Error"
        else
          @final_output = @output[0]["AQI"].to_i
        end

      rescue => e
        Rails.logger.error "API Fetch Error: #{e.message}"
        @final_output = "Error"
      end

        if params[:zipcode] == ""
          @message_zipcode = "Hey you forgot to enter a zipcode!"
        elsif @final_output == "Error"
          @message_zipcode = "Hey, that #{@zip_query} zipcode doesn't exist!"
        else
          @message_zipcode = "This is the current ozone air quality readout for the #{@zip_query} zipcode."
        end

        if @final_output == "Error"
            @api_color = "gray-bg"
        elsif @final_output <= 50
            @api_color = "green-bg"
            @api_description = "Air quality is considered satisfactory, and air pollution poses little or no risk."
        elsif @final_output >= 51 && @final_output <= 100
            @api_color = "yellow-bg"
            @api_description = "Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution."
        elsif @final_output >= 101 && @final_output <= 150
            @api_color = "orange-bg"
            @api_description = "Members of sensitive groups may experience health effects. The general public is not likely to be affected."
        elsif @final_output >= 151 && @final_output <= 200
            @api_color = "red-bg"
            @api_description = "Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects."
        elsif @final_output >= 201 && @final_output <= 300
            @api_color = "purple-bg"
            @api_description = "Health alert: everyone may experience more serious health effects."
        elsif @final_output >= 301
            @api_color = "maroon-bg"
            @api_description = "Health warnings of emergency conditions. The entire population is more likely to be affected."
        else
            @api_color = "gray-bg"
        end
  end
end



=begin
class HomeController < ApplicationController
  def index
    require "net/http"
    require "json"

    @zipCode = 77447
    @url = "https://www.airnowapi.org/aq/observation/zipCode/historical/?format=application/json&zipCode=#{@zipCode}&date=2024-12-21T00-0000&distance=50&API_KEY=CCAA2666-38CE-426B-BC5C-3FA17C2F9FBC"
    @uri = URI(@url)

    begin
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)

      if @output.empty? || @output[0]["AQI"].nil?
        @final_output = "Error"
      else
        @final_output = @output[0]["AQI"].to_i
      end

    rescue => e
      Rails.logger.error "API Fetch Error: #{e.message}"
      @final_output = "Error"
    end

    @api_color = case @final_output
    when "Error"
                   "gray-bg"
    when 0..50
                   "green-bg"
    when 51..100
                   "yellow-bg"
    when 101..150
                   "orange-bg"
    when 151..200
                   "red-bg"
    when 201..300
                   "purple-bg"
    else
                   "maroon-bg"
    end
  end
end
=end
