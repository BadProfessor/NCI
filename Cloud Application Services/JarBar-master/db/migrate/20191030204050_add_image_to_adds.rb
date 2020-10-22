class AddImageToAdds < ActiveRecord::Migration[5.2]
  def change
    add_column :adds, :image, :string
  end
end
