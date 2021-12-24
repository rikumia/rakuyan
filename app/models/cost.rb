class Cost < ApplicationRecord
  belongs_to  :user, optional: true

  validates :cliant_name, presence: true
  validates :calendar, presence: true
  validates :sales, presence: true
  validates :cost, presence: true
  validates :tax, presence: true
  validates :profit, presence: true
end
