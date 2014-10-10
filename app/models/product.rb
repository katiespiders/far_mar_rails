class Product < ActiveRecord::Base
  belongs_to :vendor

  def path
    "/products/#{self.id}"
  end

  def edit_path
    "/products/#{self.id}/edit"
  end

  def delete_path
    "/products/#{self.id}/destroy"
  end
end
