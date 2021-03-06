class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :company, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'が無効です。英字と数字を含めてください。', if: :password_required?

  has_many :works, dependent: :destroy
  has_many :cliants, dependent: :destroy
  has_many :costs, dependent: :destroy
  has_many :cost_pdfs, dependent: :destroy
end
