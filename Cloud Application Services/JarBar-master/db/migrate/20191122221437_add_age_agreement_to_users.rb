class AddAgeAgreementToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Age_Agreement, :boolean, default: false
  end
end
