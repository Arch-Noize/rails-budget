class Purchase < ApplicationRecord
    belongs_to :user, foreign_key: "author_id"
    has_many :groups

    validates :name, presence: true
    validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0.01}
    validates :author_id, presence: true
end
