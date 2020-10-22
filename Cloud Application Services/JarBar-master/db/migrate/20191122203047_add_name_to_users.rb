class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :First_Name, :string
    add_column :users, :Last_Name, :string
  end
end
