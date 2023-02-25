class Category < ApplicationRecord
    has_many :category_records, dependent: :delete_all
  has_many :records, through: :category_records, dependent: :delete_all

  def total_amount
    records.sum('amount')
  end
end
