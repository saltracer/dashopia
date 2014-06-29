class CreateDependantTasks < ActiveRecord::Migration
  def change
    create_table :dependant_tasks do |t|
      t.references :task, index: true

      t.timestamps
    end
  end
end
