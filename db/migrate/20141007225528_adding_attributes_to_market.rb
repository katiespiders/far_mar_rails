class AddingAttributesToMarket < ActiveRecord::Migration
  def change
    add_column :markets, :name, :string
    add_column :markets, :street_address, :string
    add_column :markets, :city, :string
    add_column :markets, :state, :string
    add_column :markets, :zipcde, :integer
  end
end
