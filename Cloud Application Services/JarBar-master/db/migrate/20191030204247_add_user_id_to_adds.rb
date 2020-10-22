class AddUserIdToAdds < ActiveRecord::Migration[5.2]
  def change
    add_column :adds, :user_id, :integer
  end
end
