class Cliant < ApplicationRecord
  belongs_to  :user, optional: true

  validates :cliant_name, presence: true
  validates :email, presence: true
  validates :tell, presence: true, format: { with: /\A\d{10,11}\z/, message: 'は半角数字のみで記述してください' }
  validates :address, presence: true
end
