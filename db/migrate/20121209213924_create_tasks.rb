class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.datetime :due
      t.boolean :completed, :default => false
      t.boolean :repeatable, :default => false
      t.integer :points, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end
