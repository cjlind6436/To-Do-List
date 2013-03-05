class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :name
      t.string :description
      t.boolean :repeatable, :default => false
      t.boolean :completed, :default => false
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end
end
