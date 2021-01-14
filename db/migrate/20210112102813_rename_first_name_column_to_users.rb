class RenameFirstNameColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :First_name, :first_name
  end
end
