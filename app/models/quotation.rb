class Quotation < ApplicationRecord
  belongs_to :cost_pdf

  validates :product_name, presence: true
  validates :money, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
end
