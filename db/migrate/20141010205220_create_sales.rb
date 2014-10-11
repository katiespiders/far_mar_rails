class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :number_sold
      t.integer :cost
      t.integer :product_id

      t.timestamps
    end
  end
end
