class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
     add_column :users, :postcode, :integer 
     add_column :users, :prefecture_code, :string
     add_column :users, :address_city, :string 
     add_column :users, :address_street, :string 
     add_column :users, :address_building, :string 
     add_column :users, :birthday, :date
     add_column :users, :name, :string
  end
end
