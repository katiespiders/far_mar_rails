class AddColumnsToVendor < ActiveRecord::Migration
  def change
    add_column(:vendors, :description, :text)
    add_column(:vendors, :website, :string)
    add_column(:vendors, :email, :string)
    add_column(:vendors, :phone, :integer)
  end
end
