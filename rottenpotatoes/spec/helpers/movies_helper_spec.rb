require 'spec_helper'
include MoviesHelper

describe MoviesHelper do
  it "should test oddness correctly" do
    oddness(3).should == "odd"
  end
end
