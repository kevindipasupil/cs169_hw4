require 'spec_helper'
require 'debugger'
require './app/controllers/movies_controller.rb'

describe MoviesController do
  before(:each) do
    @movie = Movie.create(:title => "The Dark Knight Returns", :rating => "NC-17", :director => "Christopher Nolan")
    @movie_id = @movie.id
  end
  it "should create a new movie" do
    new_movie = {:title => "The Dark Knight Rises", :rating => "NC-17", :director => "Christopher Nolan"}
    get :create, :movie => new_movie
    Movie.find_by_title("The Dark Knight Rises").should_not be_nil
  end
  it "should destroy a movie" do
    get :destroy, {:id => @movie_id}
    Movie.find_by_title("The Dark Knight Returns").should be_nil
  end
  it "should not have a sort in the beginning" do
    get :index
    controller.params[:sort].should == nil
  end
  it "should render the index correctly" do
    get :index
    response.should render_template('movies/index')
  end
end
