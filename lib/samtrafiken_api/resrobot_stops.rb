module SamtrafikenAPI

  # Samtrafiken ResRobot Stolptidtabeller API.
  #
  # Documentation: http://www.trafiklab.se/api/resrobot-stolptidtabeller
  #
  # @see 
  #   See resrobot_stops_spec.rb for details of how to use this class.
  #
  # @example
  #   @rr = SamtrafikenAPI::ResrobotStops.new('MY-API-KEY')
  #   @rr.set_mode(:realtime)
  #   query = {key: "value"}
  #   result = @rr.get_departures query 
  #   #=> {...}
  class ResrobotStops < APIBase
    #debug_output $stdout

    # Get the URIs of this API's two API modes.
    #
    # @return [Hash] with the keys `:timetable` and `:realtime`.
    def self.uris
      {
        timetable: 'https://api.trafiklab.se/samtrafiken/resrobotstops',
        realtime: 'https://api.trafiklab.se/samtrafiken/resrobotstopssuper'
      }
    end

    base_uri self.uris[:timetable]

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
      return read_response @response
    end

  end
end
