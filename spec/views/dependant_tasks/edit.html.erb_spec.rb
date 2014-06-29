require 'rails_helper'

RSpec.describe "dependant_tasks/edit", :type => :view do
  before(:each) do
    @dependant_task = assign(:dependant_task, DependantTask.create!(
      :task => nil
    ))
  end

  it "renders the edit dependant_task form" do
    render

    assert_select "form[action=?][method=?]", dependant_task_path(@dependant_task), "post" do

      assert_select "input#dependant_task_task_id[name=?]", "dependant_task[task_id]"
    end
  end
end
