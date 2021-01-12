class AddFirstNameKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :First_name_kana, :string
  end
end
