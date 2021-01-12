class AddFirstNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :First_name, :string
  end
end
