require "rails_helper"

RSpec.describe DependantTasksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dependant_tasks").to route_to("dependant_tasks#index")
    end

    it "routes to #new" do
      expect(:get => "/dependant_tasks/new").to route_to("dependant_tasks#new")
    end

    it "routes to #show" do
      expect(:get => "/dependant_tasks/1").to route_to("dependant_tasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dependant_tasks/1/edit").to route_to("dependant_tasks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dependant_tasks").to route_to("dependant_tasks#create")
    end

    it "routes to #update" do
      expect(:put => "/dependant_tasks/1").to route_to("dependant_tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dependant_tasks/1").to route_to("dependant_tasks#destroy", :id => "1")
    end

  end
end
