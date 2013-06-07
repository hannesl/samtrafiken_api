require 'httparty'
require 'samtrafiken_api/resrobot'

# A wrapper for the Samtrafiken web API.
module SamtrafikenAPI
  class <<self
    # Return "Hello world."
    #
    # @return [String] the string "Hello World!".
    def hi
      return "Hello world!"
    end

    # A custom error class which passes the HTTParty response.
    class RequestError < StandardError
      attr_reader :response

      def initialize(response)
        @response = response
      end
    end

    # Parse a HTTParty response and return parsed data.
    #
    # @param response [HTTParty:Response] the HTTParty response.
    # @return [Hash] a hash containing a `:data` object and `:response` – a 
    #   HTTParty::Response object.
    def parse_response response
      data = response.parsed_response
      data = data[data.keys[0]]
      if response.code == 200
        return {data: data, response: response}
      else
        message = data['errors']['error']['errordescription']
        raise RequestError.new(response), message
      end
    end
  end
end
