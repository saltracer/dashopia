require 'rails_helper'

RSpec.describe "dependant_tasks/index", :type => :view do
  before(:each) do
    assign(:dependant_tasks, [
      DependantTask.create!(
        :task => nil
      ),
      DependantTask.create!(
        :task => nil
      )
    ])
  end

  it "renders a list of dependant_tasks" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
