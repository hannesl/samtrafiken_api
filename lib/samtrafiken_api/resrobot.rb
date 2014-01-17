module SamtrafikenAPI

  # Samtrafiken ResRobot API.
  #
  # Documentation: http://www.trafiklab.se/api/resrobot-sok-resa
  #
  # @see 
  #   See resrobot_spec.rb for details of how to use this class.
  #
  # @example
  #   @rr = SamtrafikenAPI::Resrobot.new('MY-API-KEY')
  #   @rr.set_mode(:realtime)
  #   query = {key: "value"}
  #   result = @rr.search query
  #   #=> {...}
  class Resrobot < APIBase
    #debug_output $stdout

    # Get the URIs of this API's two API modes.
    #
    # @return [Hash] with the keys `:timetable` and `:realtime`.
    def self.uris
      {
        timetable: 'https://api.trafiklab.se/samtrafiken/resrobot',
        realtime: 'https://api.trafiklab.se/samtrafiken/resrobotsuper'
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

    # Endpoint: Search
    #
    # Documentation: http://www.trafiklab.se/api/resrobot/search
    #
    # @param query [Hash] query keys and values.
    # @return [Hash] a hash containing the returned data.
    def search query
      @response = self.class.get('/Search.json', :query => query)
      return read_response @response
    end

    # Endpoint: StationsInZone
    #
    # Documentation: http://www.trafiklab.se/api/resrobot/stationsinzone
    #
    # @param query [Hash] query keys and values.
    # @return [Hash] a hash containing the returned data.
    def stations_in_zone query
      @response = self.class.get('/StationsInZone.json', :query => query)
      return read_response @response
    end

    # Endpoint: TimeTablePeriod
    #
    # Documentation: http://www.trafiklab.se/api/resrobot/timetableperiod
    #
    # @return [Hash] a hash containing the returned data.
    def time_table_period
      @response = self.class.get('/TimeTablePeriod.json')
      return read_response @response
    end

    # Endpoint: ProducerList
    #
    # Documentation: http://www.trafiklab.se/api/resrobot/producerlist
    #
    # @return [Hash] a hash containing the returned data.
    def producer_list
      @response = self.class.get('/ProducerList.json')
      return read_response @response
    end

    # Endpoint: TransportModeList
    #
    # Documentation: http://www.trafiklab.se/api/resrobot/transportmodelist
    #
    # @return [Hash] a hash containing the returned data.
    def transport_mode_list
      @response = self.class.get('/TransportModeList.json')
      return read_response @response
    end

    # Endpoint: FindLocation
    #
    # Documentation: http://www.trafiklab.se/api/resrobot/findlocation
    #
    # @param query [Hash] query keys and values.
    # @return [Hash] a hash containing the returned data.
    def find_location query
      @response = self.class.get('/FindLocation.json', :query => query)
      return read_response @response
    end

  end
end
