require 'rails_helper'

RSpec.describe "tasks/show", :type => :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :name => "Name",
      :user => nil,
      :status => 1,
      :priority => 2,
      :location_id => 3,
      :duration => 4,
      :due_event => "Due Event",
      :reminder_type => 5,
      :occurance_id => 6,
      :occurance_deleted => false,
      :parent_id => 7,
      :collapse => false,
      :child_duration => 8
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Due Event/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/8/)
  end
end
