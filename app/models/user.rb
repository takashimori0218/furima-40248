class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :nickname,           presence: true
  validates :last_name,          presence: true, format: { with: NAME_REGEX, message: 'は全角で入力して下さい。' }
  validates :first_name,         presence: true, format: { with: NAME_REGEX, message: 'は全角で入力して下さい。' }
  validates :last_name_kana,     presence: true, format: { with: NAME_KANA_REGEX, message: 'は全角カタカナで入力して下さい。' }
  validates :first_name_kana,    presence: true, format: { with: NAME_KANA_REGEX, message: 'は全角カタカナで入力して下さい。' }
  validates :birthdate,          presence: true
  validates :password,           format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
end
