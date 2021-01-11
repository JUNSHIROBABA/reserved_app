class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  # Active Hash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # Association

  # Validation
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/}
    validates :phone, format: { with: /\A\d{11}\z/}
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0}
    validates :city
    validates :address

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
      validates :lastname
      validates :firstname
    end

    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :lastname_kana
      validates :firstname_kana
    end
  end
end
