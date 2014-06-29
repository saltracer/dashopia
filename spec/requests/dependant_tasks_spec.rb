require 'rails_helper'

RSpec.describe "DependantTasks", :type => :request do
  describe "GET /dependant_tasks" do
    it "works! (now write some real specs)" do
      get dependant_tasks_path
      expect(response.status).to be(200)
    end
  end
end
