class RenameTaskNameToTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :name, :titles
  end
end
