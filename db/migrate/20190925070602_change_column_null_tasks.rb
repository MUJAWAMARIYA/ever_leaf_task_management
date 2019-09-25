class ChangeColumnNullTasks < ActiveRecord::Migration[5.2]
  def change
    changeColumn :tasks, :name, :string, null: false
    changeColumn :tasks, :content, :string, null: false
    changeColumn :tasks, :priority, :string, null: false
    changeColumn :tasks, :status, :string, null: false
    
  end
end
