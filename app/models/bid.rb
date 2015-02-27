class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :amount, numericality: {greater_than_or_equal_to: 0}

end
