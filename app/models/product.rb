class Product < ActiveRecord::Base
  belongs_to :vendor

  def path
    "/products/#{self.id}"
  end
end
