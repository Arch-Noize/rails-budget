class CreateGroupPurchasesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :group_purchases_tables do |t|
      t.references :groups, null: false, foreign_key: true
      t.references :purchases, null: false, foreign_key: true

      t.timestamps
    end
  end
end
