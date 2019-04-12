require_relative '../lib/dark_trader'

  main_function = dark_trader # Je stock le retour de la fonction pour ne pas avoir à la lancer plusieurs fois

describe "the dark_trader method" do
  it "should return an array, and the array is not nil" do
    expect(main_function).not_to be_nil
  end
    it "should return a hash" do
      expect(main_function.class).to eq(Array)
    end
    it "should return more than 700 currencies" do
      expect(main_function.length).to be > 700 
    end
  end
