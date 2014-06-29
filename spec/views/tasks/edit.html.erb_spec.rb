require 'rails_helper'

RSpec.describe "tasks/edit", :type => :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :name => "MyString",
      :user => nil,
      :status => 1,
      :priority => 1,
      :location_id => 1,
      :duration => 1,
      :due_event => "MyString",
      :reminder_type => 1,
      :occurance_id => 1,
      :occurance_deleted => false,
      :parent_id => 1,
      :collapse => false,
      :child_duration => 1
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "input#task_user_id[name=?]", "task[user_id]"

      assert_select "input#task_status[name=?]", "task[status]"

      assert_select "input#task_priority[name=?]", "task[priority]"

      assert_select "input#task_location_id[name=?]", "task[location_id]"

      assert_select "input#task_duration[name=?]", "task[duration]"

      assert_select "input#task_due_event[name=?]", "task[due_event]"

      assert_select "input#task_reminder_type[name=?]", "task[reminder_type]"

      assert_select "input#task_occurance_id[name=?]", "task[occurance_id]"

      assert_select "input#task_occurance_deleted[name=?]", "task[occurance_deleted]"

      assert_select "input#task_parent_id[name=?]", "task[parent_id]"

      assert_select "input#task_collapse[name=?]", "task[collapse]"

      assert_select "input#task_child_duration[name=?]", "task[child_duration]"
    end
  end
end
