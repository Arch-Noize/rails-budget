class ChangeAmountInPurchases < ActiveRecord::Migration[7.1]
  def change
    change_column :purchases, :amount, :decimal, default: 0.00, precision: 8, scale: 2
  end
end
