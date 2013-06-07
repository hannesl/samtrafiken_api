module SamtrafikenAPI

  # Samtrafiken ResRobot API.
  # Documentation: http://www.trafiklab.se/api/resrobot-sok-resa
  class Resrobot
    include HTTParty

    def self.uris
      {
        timetable: 'api.trafiklab.se/samtrafiken/resrobot',
        realtime: 'api.trafiklab.se/samtrafiken/resrobotsuper'
      }
    end

    base_uri self.uris[:timetable]

    @api_key = ''

    # Initialize a new API object.
    #
    # @param api_key [String] The ResRobot Sök resa API key.
    def initialize(api_key)
      @api_key = api_key
    end

    format :json

    #default_params :output => 'json'

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
