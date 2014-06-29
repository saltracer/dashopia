class Task < ActiveRecord::Base
  belongs_to :user
  has_many :dependant_tasks
end
