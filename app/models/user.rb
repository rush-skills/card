class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook]
  validates_presence_of :name

  def self.from_omniauth(auth)
  where(provider: auth.provider, unid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password ||= Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.pic = auth.info.image # assuming the user model has an image
    hex = SecureRandom.hex(3)
    while User.find_by_uid(hex)
    	hex = SecureRandom.hex(3)
    end
    user.uid ||= hex
  end
end
end
