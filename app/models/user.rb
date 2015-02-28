class User < ActiveRecord::Base
  has_secure_password
  
  has_many :auctions, dependent: :destroy
  has_many :bids, dependent: :destroy

  validates :username, presence: true # , uniqueness: true
  validates :password_digest, presence: true

end
