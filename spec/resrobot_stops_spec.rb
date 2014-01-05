require 'samtrafiken_api'

describe SamtrafikenAPI::ResrobotStops do
  before do
    @rr = SamtrafikenAPI::ResrobotStops.new(ENV['RESROBOT_STOPS_API_KEY'])
  end

  it "can set the API mode" do
    expect {
      @rr.set_mode(:realtime)
      @rr.set_mode(:timetable)
    }.to_not raise_error
    expect {
      @rr.set_mode(:bogus_mode)
    }.to raise_error
  end

  it "can make a GetDepartures request" do
    query = {
      locationId: 7424929,
      timeSpan: 30,
      coordSys: 'WGS84',
    }
    expect {
      result = @rr.get_departures query 
      result.should be_an(Object)
    }.to_not raise_error
    @rr.response.class.should == HTTParty::Response
  end

  it "raises error on invalid GetDepartures requests" do
    expect {
      @rr.get_departures({})
    }.to raise_error
    @rr.response.class.should == HTTParty::Response
  end

end
