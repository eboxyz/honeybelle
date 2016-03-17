class AddDiscountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :total_discount, :string
  end
end
