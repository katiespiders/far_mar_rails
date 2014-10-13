class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products

  def path
    "/vendors/#{self.id}"
  end

  def edit_path
    "/vendors/#{self.id}/edit"
  end

  def delete_path
    "/vendors/#{self.id}/destroy"
  end
end
