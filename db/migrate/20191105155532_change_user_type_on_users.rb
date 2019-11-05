class ChangeUserTypeOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :title, 'user'
  end
end
