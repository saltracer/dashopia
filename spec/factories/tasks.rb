# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    user nil
    status 1
    priority 1
    location_id 1
    start_at "2014-06-29 00:13:46"
    duration 1
    finish_at "2014-06-29 00:13:46"
    due_at "2014-06-29 00:13:46"
    due_event "MyString"
    reminder_at "2014-06-29 00:13:46"
    reminder_type 1
    occurance_id 1
    occurance_deleted false
    parent_id 1
    collapse false
    child_duration 1
  end
end
