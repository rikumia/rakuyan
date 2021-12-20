class Cliant < ApplicationRecord
  belongs_to  :work
  belongs_to  :user

  validates :cliant_name, presence: true
  validates :email, presence: true
  validates :tell, presence: true
  validates :address, presence: true
end
