class Purchase < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :group_purchases, dependent: :destroy
  has_many :groups, through: :group_purchases, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :groups, presence: true
  validates :author_id, presence: true

  private

  def at_least_one_group
    errors.add(:groups, 'must be selected') if groups.empty?
  end
end
