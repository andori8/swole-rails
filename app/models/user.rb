class User < ApplicationRecord
  has_many :workouts
  has_many :exercises
  has_many :comments
  validates :name, presence: true, unless: -> { from_omniauth? }
  validates :username, presence: true, unless: -> { from_omniauth? }
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

      private

def from_omniauth?
  provider && uid
end
end
