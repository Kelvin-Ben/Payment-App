class Record < ApplicationRecord
    belongs_to :user
    has_many :category_records, dependent: :delete_all
    has_many :categories, through: :category_records
end
