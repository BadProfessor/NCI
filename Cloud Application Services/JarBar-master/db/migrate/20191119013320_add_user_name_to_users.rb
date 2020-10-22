class AddUserNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :UserName, :string
    add_column :users, :string, :string
  end
end
