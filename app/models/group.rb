class Group < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_many :group_purchases, dependent: :destroy
    has_many :purchases, through: :group_purchases, dependent: :destroy

    validates :name, presence: true
    validates :icon, presence: true

    # Returns the total amount of all purchases in the group
    def total
        purchases.sum(:amount)
    end
end
