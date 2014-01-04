module SamtrafikenAPI

  # Base class for API implementations.
  class APIBase
    include HTTParty

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

    # Parse a HTTParty response and return parsed data.
    #
    # @param response [HTTParty:Response] the HTTParty response.
    # @return [Hash] a hash containing the returned data.
    def read_response response
      data = response.parsed_response.values[0]
      if response.code == 200
        data
      else
        raise data['errors']['error']['errordescription']
      end
    end

  end
end
