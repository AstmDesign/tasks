require "rails_helper"

RSpec.describe CommentFilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/comment_files").to route_to("comment_files#index")
    end

    it "routes to #new" do
      expect(:get => "/comment_files/new").to route_to("comment_files#new")
    end

    it "routes to #show" do
      expect(:get => "/comment_files/1").to route_to("comment_files#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/comment_files/1/edit").to route_to("comment_files#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/comment_files").to route_to("comment_files#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/comment_files/1").to route_to("comment_files#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/comment_files/1").to route_to("comment_files#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/comment_files/1").to route_to("comment_files#destroy", :id => "1")
    end
  end
end
