require_relative '../lib/cher_depute'

  main_function = perform # Je stock le retour de la fonction pour ne pas avoir à la lancer plusieurs fois

describe "Tests" do
  it "Test the return variable" do
    expect(main_function.class).to eq(Array)
  end
  it "should return more than 500 deputies" do
    expect(main_function.length).to be > 500 
  end
end