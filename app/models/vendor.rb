class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :product

  def path
    "/vendors/#{self.id}"
  end

  def add_product_path
    "/vendors/#{self.id}/add_product"
  end
end
