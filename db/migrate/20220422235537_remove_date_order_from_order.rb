class RemoveDateOrderFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :date_order
  end
end
