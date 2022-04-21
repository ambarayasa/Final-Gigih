class AddDefaultValueToOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :total_price, :float, :default => 0.0
  end
end
