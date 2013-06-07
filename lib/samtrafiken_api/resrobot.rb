module SamtrafikenAPI

  # Samtrafiken ResRobot API.
  # Documentation: http://www.trafiklab.se/api/resrobot-sok-resa
  class Resrobot
    include HTTParty
    #debug_output $stdout

    def self.uris
      {
        timetable: 'https://api.trafiklab.se/samtrafiken/resrobot',
        realtime: 'https://api.trafiklab.se/samtrafiken/resrobotsuper'
      }
    end

    base_uri self.uris[:timetable]

    # Initialize a new API object.
    #
    # @param api_key [String] The ResRobot Sök resa API key.
    def initialize(api_key)
      self.class.default_params({
        apiVersion: '2.1',
        key: api_key
      })
    end

    format :json

    # Set the API mode to use either real time or time table data.
    #
    # @param mode [Symbol] either `:timetable` or `:realtime`.
    def set_mode mode
      if self.class.uris.has_key? mode
        self.class.base_uri self.class.uris[mode]
      else
        raise "Invalid API mode."
      end
    end

    # Endpoint: Search
    # Documentation: http://www.trafiklab.se/api/resrobot/search
    #
    # @param query [Hash] query keys and values.
    # @return [Hash] a hash containing a `:data` object and `:response` – a 
    #   HTTParty::Response object.
    def search query
      response = self.class.get('/Search.json', :query => query)
      return SamtrafikenAPI.parse_response response
    end

    # Endpoint: StationsInZone
    # Documentation: http://www.trafiklab.se/api/resrobot/stationsinzone

    # Endpoint: TimeTablePeriod
    # Documentation: http://www.trafiklab.se/api/resrobot/timetableperiod

    # Endpoint: ProducerList
    # Documentation: http://www.trafiklab.se/api/resrobot/producerlist

    # Endpoint: TransportModeList
    # Documentation: http://www.trafiklab.se/api/resrobot/transportmodelist

    # Endpoint: FindLocation
    # Documentation: http://www.trafiklab.se/api/resrobot/findlocation

  end
end
