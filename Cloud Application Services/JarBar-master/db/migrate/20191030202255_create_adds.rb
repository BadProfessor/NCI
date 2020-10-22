class CreateAdds < ActiveRecord::Migration[5.2]
  def change
    create_table :adds do |t|
      t.string :category
      t.string :title
      t.text :description
      t.string :vintage
      t.decimal :price, precision: 5, scale: 2, Default: 0

      t.timestamps
    end
  end
end
