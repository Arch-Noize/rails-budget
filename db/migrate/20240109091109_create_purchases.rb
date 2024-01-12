class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.text :name
      t.decimal :amount, default: 0.00
      t.references :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
