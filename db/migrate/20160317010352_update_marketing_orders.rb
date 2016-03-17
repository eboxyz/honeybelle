class UpdateMarketingOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :marketing
  end
end
