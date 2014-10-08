class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :product

  def path
    "/vendors/#{self.id}"
  end
end
