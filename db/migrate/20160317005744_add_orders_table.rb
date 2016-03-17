class AddOrdersTable < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.text  :processed
      t.text  :total_price
    end
  end
end
