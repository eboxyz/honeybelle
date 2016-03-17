class UpdateMarketingOrdersboolean < ActiveRecord::Migration
  def change
    add_column :orders, :marketing, :boolean
  end
end
