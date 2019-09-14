class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :content
      t.datetime :start_date
      t.datetime :end_date
      t.string :kind_of_task
      t.string :priority
      t.string :status

      t.timestamps
    end
  end
end
