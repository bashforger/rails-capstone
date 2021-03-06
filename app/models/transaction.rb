class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :transaction_groups, dependent: :destroy

  validates :name, length: { maximum: 30 }
  validates :amount, presence: true, numericality: true

  def group_ids
    transaction_groups.map(&:group_id)
  end

  def group_id
    transaction_groups.first.group_id unless transaction_group_ids.empty?
  end
end
