class Category < ApplicationRecord
  belongs_to :user
  has_many :category_records, dependent: :delete_all
  has_many :records, through: :category_records, dependent: :delete_all
  has_one_attached :image

  validates :name, presence: true
  validates :user, presence: true

  def total_amount
    records.sum('amount')
  end

  def recent_transactions
    records.order(created_at: :desc)
  end
end
