class TaskLabel < ActiveRecord::Migration[5.2]
  def change
    create_table :task_labels do |t|
      t.references :labels
      t.references :tasks
      t.timestamps null: false
    end
  end

end
