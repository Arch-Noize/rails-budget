class GroupPurchase < ApplicationRecord
  self.table_name = 'group_purchases_tables'
  belongs_to :group
  belongs_to :purchase
end
