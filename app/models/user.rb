class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :categories

  # has_many :categories, foreign_key: 'user_id'
  # has_many :records, foreign_key: 'user_id'

  def admin?
    role == 'admin'
  end

  validates :name, presence: true
end
