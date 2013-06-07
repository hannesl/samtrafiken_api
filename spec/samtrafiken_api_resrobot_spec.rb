require 'samtrafiken_api'

describe SamtrafikenAPI::Resrobot do
  before do
    @rr = SamtrafikenAPI::Resrobot.new(ENV['RESROBOT_API_KEY'])
  end

  it "set API mode" do
    expect {
      @rr.set_mode(:realtime)
      @rr.set_mode(:timetable)
    }.to_not raise_error
    expect {
      @rr.set_mode(:bogus_mode).should be_false
    }.to raise_error
  end
end
