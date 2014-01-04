require 'httparty'
require 'samtrafiken_api/api_base'
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
