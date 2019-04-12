require_relative '../lib/mairie_chritmas'

  main_function = perform # Je stock le retour de la fonction pour ne pas avoir à la lancer plusieurs fois

describe "Tests the general function" do
  it "Should be true" do
    expect(main_function.class).to eq(Array)
  end
  it "should return more than 100 email address" do
    expect(main_function.length).to be > 100 
  end
end