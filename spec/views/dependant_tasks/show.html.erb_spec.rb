require 'rails_helper'

RSpec.describe "dependant_tasks/show", :type => :view do
  before(:each) do
    @dependant_task = assign(:dependant_task, DependantTask.create!(
      :task => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
