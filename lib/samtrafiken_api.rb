require 'httparty'
require 'samtrafiken_api/resrobot'
require 'samtrafiken_api/resrobot_stops'
require 'json'

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
      data = response.parsed_response.values[0]
      if response.code == 200
        data
      else
        raise data['errors']['error']['errordescription']
      end
    end
  end
end

# Monkey patching HTTParty::Parser::json to convert API data to UTF-8.
# See http://www.trafiklab.se/blogg/2013/aug/13e-september-uppgraderas-api-proxyn-alla-bor-testa-sina-applikationer
module HTTParty
  class Parser
    def json
      JSON.load(body.force_encoding("ISO-8859-1").encode("UTF-8"), nil)
    end
  end
end
