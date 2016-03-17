class AddCustomersTable < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :customer_id
      t.text    :name
      t.text    :email
      t.text    :address
      t.boolean :marketing, default: false
      t.integer :total
    end
  end
end
