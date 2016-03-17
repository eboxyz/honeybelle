class AddMarketingToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :marketing, :string
  end
end
