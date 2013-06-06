require 'httparty'

#response = HTTParty.get('https://api.trafiklab.se/samtrafiken/resrobot/StationsInZone.json?apiVersion=2.1&centerX=18.0819845&centerY=59.3097561&radius=500&coordSys=WGS84&key=1e772de189288e6d300e8c8f039574fb')

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
