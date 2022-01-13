class CostPdf < ApplicationRecord
  belongs_to :user, optional: true
  has_many :quotations, dependent: :destroy
  accepts_nested_attributes_for :quotations, allow_destroy: true

  validates :company_name, presence: true
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は次のように記述してください(例123-4567)' }
  validates :address, presence: true
  validates :tell, presence: true, format: { with: /\A\d{10,11}\z/, message: 'は半角数字のみで記述してください' }
  validates :fax, length: { minimum: 2 },  allow_blank: true, format: { with: /\A\d{10,11}\z/, message: 'は半角数字のみで記述してください' }
  validates :subtotal, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates :tax, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates :total, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates :cliant_name, presence: true
end
