require 'rails_helper'

RSpec.describe "dependant_tasks/new", :type => :view do
  before(:each) do
    assign(:dependant_task, DependantTask.new(
      :task => nil
    ))
  end

  it "renders new dependant_task form" do
    render

    assert_select "form[action=?][method=?]", dependant_tasks_path, "post" do

      assert_select "input#dependant_task_task_id[name=?]", "dependant_task[task_id]"
    end
  end
end
