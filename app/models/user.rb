class User < ApplicationRecord
  has_many :workouts
  has_many :exercises
  has_many :comments
  validates :name, presence: true
  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

      def self.from_omniauth(auth)
         where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
           user.email = auth.info.email
           user.password = Devise.friendly_token[0,20]
         end
      end
end
