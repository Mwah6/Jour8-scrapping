require_relative '../lib/dark_trader'

describe "the dark_trader method" do
  it "should return an array, and the array is not nil" do
    expect(dark_trader).not_to be_nil
end
    it "should return a hash" do
      expect(dark_trader.class).to eq(Array)
    end
    it "should return more than 700 currencies" do
      expect(dark_trader.length > 700).to eq(true)
    end
    # it "should return a COZ" do
    #   # expect(dark_trader.include? ([1])).to eq(true)
    #     expect(dark_trader.flatten(2).include? ("MEDIBIT") ).to eq(true)
    # end
    # it "should return a VPRC" do
    #   expect(dark_trader.include? ({"VPRC"=>"0.000002"})).to eq(true)
    # end
    # it "should return a ACDC" do
    #   expect(dark_trader.include? ({"ACDC"=>"0.000843"})).to eq(true)
    # end

  end
