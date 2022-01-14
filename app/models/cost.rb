class Cost < ApplicationRecord
  belongs_to  :user, optional: true

  validates :cliant_name, presence: true
  validates :calendar, presence: true
  validates :sales, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates :cost, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates :profit, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  # validates :profit_was, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
end
