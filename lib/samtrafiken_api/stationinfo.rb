require 'open-uri'

module SamtrafikenAPI

  # Samtrafiken Stationsinfo API.
  #
  # Documentation: http://www.trafiklab.se/api/samtrafiken-stationsinfo
  #
  # @see 
  #   See stationsinfo_spec.rb for details of how to use this class.
  #
  # @example
  #   @si = SamtrafikenAPI::StationsInfo.new('MY-API-KEY')
  #   result = @si.stations
  #   #=> [...]
  class Stationinfo < APIBase
    #debug_output $stdout

    base_uri 'https://api.trafiklab.se/samtrafiken/stationinfo'

    # Endpoint: Stations
    #
    # Documentation: http://www.trafiklab.se/api/samtrafiken-stationsinfo/alla-stationer
    #
    # @param query [Hash] query keys and values.
    # @return [Array] an array of all station hashes.
    def stations query = {}
      @response = self.class.get('/stations.json', :query => query)
      read_response(@response)
    end

    # Endpoint: Category
    #
    # Documentation: http://www.trafiklab.se/api/samtrafiken-stationsinfo/lista-stationer-baserat-pa-kategori
    #
    # @param id [Integer] the category ID.
    # @param query [Hash] query keys and values.
    # @return [Array] an array of station objects.
    def category id, query = {}
      @response = self.class.get("/category/#{id}.json", :query => query)
      read_response(@response)
    end

    # Endpoint: Station
    #
    # Documentation: http://www.trafiklab.se/api/samtrafiken-stationsinfo/information-om-en-station
    #
    # @param id [Integer] the station ID.
    # @return [Hash] a hash containing the station data.
    def station id
      @response = self.class.get("/stations/#{id}.json")
      read_response(@response)
    end

    # Endpoint: Image
    #
    # Documentation: http://www.trafiklab.se/api/samtrafiken-stationsinfo/bilder
    #
    # @todo: the images endpoint is currently broken and doesn't return valid
    # image data. This method has not been successfully tested.
    #
    # @param id [Integer] the image ID.
    # @return [String] image data.
    def image id
      query = URI.encode_www_form self.class.default_params
      open("#{self.class.base_uri}/images/#{id}.json?#{query}") { |f| f.read }
    end

  end
end
