class ChangeVendorPhoneToString < ActiveRecord::Migration
  def change
    change_column(:vendors, :phone, :string)
  end
end
