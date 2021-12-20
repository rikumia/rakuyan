class Work < ApplicationRecord
  belongs_to  :user
  has_many :cliants

  validates :cliant_name, presence: true
  validates :job_description, presence: true
  validates :calendar, presence: true
  validates :work_place, presence: true
  # validates :price, presence: true: true, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
end
