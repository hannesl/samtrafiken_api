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

  it "can do a Search request" do
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
      @response = @rr.search(query)
    }.to_not raise_error
    @response.should have_key(:data)
  end


  it "raises error on invalid requests" do
    expect {
      @rr.search({})
    }.to raise_error
  end
end
