class Auction < ActiveRecord::Base

  include AASM

  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :title, presence: true # , uniqueness: true
  validates :body, presence: true
  validates :closing_date, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}
  validates :reserve, presence: true

  aasm do
    state :published, initial: true
    state :reserve_met
    state :reserve_not_met
    state :won
    state :cancelled

    event :cancel do
      transitions from: [:published, :reserve_not_met], to: :cancelled
    end

    event :unfund do
      transitions from: :published, to: :reserve_not_met
    end

    event :fund do
      transitions from: :published, to: :reserve_met
    end

    event :complete do
      transitions from: :reserve_met, to: :won
    end

  end


end
