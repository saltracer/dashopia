require 'rails_helper'

RSpec.describe "tasks/index", :type => :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
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
      ),
      Task.create!(
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
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Due Event".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
  end
end
