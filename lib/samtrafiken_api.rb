require 'httparty'
require 'samtrafiken_api/resrobot'
require 'samtrafiken_api/resrobot_stops'

# A wrapper for the Samtrafiken web API.
module SamtrafikenAPI
  class <<self
    # Return "Hello world."
    #
    # @return [String] the string "Hello World!".
    def hi
      return "Hello world!"
    end

    # Parse a HTTParty response and return parsed data.
    #
    # @param response [HTTParty:Response] the HTTParty response.
    # @return [Hash] a hash containing the returned data.
    def parse_response response
      data = response.parsed_response
      data = data[data.keys[0]]
      if response.code == 200
        return data
      else
        raise data['errors']['error']['errordescription']
      end
    end
  end
end
