class Purchase < ApplicationRecord
    belongs_to :user
    has_many :groups

    validates :name, presence: true
    validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0.01}
end
