class DependantTask < ActiveRecord::Base
  belongs_to :task
  has_one :task
end
