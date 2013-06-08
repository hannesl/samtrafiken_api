require 'samtrafiken_api'

describe SamtrafikenAPI::Resrobot do
  before do
    @rr = SamtrafikenAPI::Resrobot.new(ENV['RESROBOT_API_KEY'])
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

  it "can make a Search request" do
    query = {
      from: 'Vitabergsparken',
      to: 'Luma park',
      fromX: '18.086917',
      fromY: '59.311896',
      toX: '18.09596',
      toY: '59.304503',
      coordSys: 'WGS84',
    }
    expect {
      @result = @rr.search(query)
    }.to_not raise_error
    @result.should be_an(Object)
    @rr.response.class.should == HTTParty::Response
  end

  it "raises error on invalid Search requests" do
    expect {
      @rr.search({})
    }.to raise_error
    @rr.response.class.should == HTTParty::Response
  end
end
