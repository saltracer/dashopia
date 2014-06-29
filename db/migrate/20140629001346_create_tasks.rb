class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :user, index: true
      t.integer :status
      t.integer :priority
      t.integer :location_id
      t.datetime :start_at
      t.integer :duration
      t.datetime :finish_at
      t.datetime :due_at
      t.string :due_event
      t.datetime :reminder_at
      t.integer :reminder_type
      t.integer :occurance_id
      t.boolean :occurance_deleted
      t.integer :parent_id
      t.boolean :collapse
      t.integer :child_duration

      t.timestamps
    end
  end
end
