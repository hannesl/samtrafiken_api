require 'samtrafiken_api'

describe SamtrafikenAPI do
  it "say hi" do
    SamtrafikenAPI.hi().should eql("Hello world!")
  end
end
