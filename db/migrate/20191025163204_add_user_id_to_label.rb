class AddUserIdToLabel < ActiveRecord::Migration[5.2]
  def change
     add_column :labels, :user_id, :integer
    add_reference :labels, :user, foreign_key: true
  end
end
