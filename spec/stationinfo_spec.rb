require 'samtrafiken_api'

STATION_CATEGORY_BUS = 31
STATION_SUBCATEGORY_BUSSTOP = 61
STATION_ID_STOCKHOLM_CENTRAL = 7400001
STATION_ID_MISSING = 99999999999999
STATION_IMAGE_ID_STOCKHOLM_CENTRAL = 2605

describe SamtrafikenAPI::Stationinfo do
  before do
    @si = SamtrafikenAPI::Stationinfo.new(ENV['STATIONSINFO_API_KEY'])
  end

  it "can make a List request" do
    expect {
      result = @si.stations
      result.should be_a(Hash)
      result = @si.stations sort: "name"
      result.should be_a(Hash)
    }.to_not raise_error
    @si.response.class.should == HTTParty::Response
  end

  it "can make a Category request" do
    expect {
      result = @si.category STATION_CATEGORY_BUS, propid: STATION_SUBCATEGORY_BUSSTOP
      result.should be_a(Hash)
    }.to_not raise_error
    @si.response.class.should == HTTParty::Response
  end

  it "can make a Station request" do
    expect {
      result = @si.station STATION_ID_STOCKHOLM_CENTRAL
      result.should be_a(Hash)
    }.to_not raise_error
    @si.response.class.should == HTTParty::Response
  end

  it "raises error on Station requests with missing IDs" do
    expect {
      @si.station STATION_ID_MISSING
    }.to raise_error
    @si.response.class.should == HTTParty::Response
  end

  it "can make an Image request" do
    expect {
      @si.image STATION_IMAGE_ID_STOCKHOLM_CENTRAL
      # @todo: the images endpoint is currently broken and doesn't return valid
      # image data.
    }.to_not raise_error
  end

end
