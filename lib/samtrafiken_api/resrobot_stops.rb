module SamtrafikenAPI

  # Samtrafiken ResRobot Stolptidtabeller API.
  # Documentation: http://www.trafiklab.se/api/resrobot-stolptidtabeller
  class ResrobotStops
    include HTTParty
    #debug_output $stdout

    def self.uris
      {
        timetable: 'https://api.trafiklab.se/samtrafiken/resrobotstops',
        realtime: 'https://api.trafiklab.se/samtrafiken/resrobotstopssuper'
      }
    end

    base_uri self.uris[:timetable]

    # @!attribute response
    #   @return [HTTParty::Response] the HTTParty response object for the last 
    #     request, which can be used for inspecting errors etc.
    attr_accessor :response

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


    # Endpoint: GetDepartures
    # Documentation: http://www.trafiklab.se/api/resrobot-stolptidtabeller/getdepartures
    #
    # @param query [Hash] query keys and values.
    # @return [Hash] a hash containing the returned data.
    def get_departures query
      @response = self.class.get('/GetDepartures.json', :query => query)
      return SamtrafikenAPI.parse_response @response
    end

  end
end
