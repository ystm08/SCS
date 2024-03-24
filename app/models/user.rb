class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォローしている関連付け
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォローされている関連付け
  has_many :followings, through: :active_relationships, source: :followed #フォローしているユーザーの取得
  has_many :followers, through: :passive_relationships, source: :follower #フォロワー
  has_many :notifications, dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :user_name, presence: true

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      user.name_kana = "ゲストユーザー"
      user.phone_number = "00000000000"
      user.post_code = "0000000"
      user.address = "日本"
      user.user_name = "ゲストユーザー"
      user.introduction = "ゲストログイン用ページです。"
      user.is_active = true
    end
  end

  def guest_user?
    email == GUEST_USER_EMAIL
  end

  def user_status
    if is_active == false
      "退会"
    else
      "有効"
    end
  end

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

end