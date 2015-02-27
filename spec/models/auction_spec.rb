require 'rails_helper'

RSpec.describe Auction, type: :model do
  def auction_attributes(new_attributes ={})
    valid_attributes = {title: "valid title",
                        body: "valid body",
                        amount: 10,
                        reserve: 20,
                        closing_date: "2019-11-11 10:33:20"
                      }
    valid_attributes.merge new_attributes
  end

  describe "Validations" do
    it "has a title" do
      auction = Auction.new auction_attributes({title: nil})
      expect(auction).to be_invalid
    end

    it "has a body" do
      auction = Auction.new auction_attributes({body: nil})
      expect(auction).to be_invalid
    end

    it "has an amount of zero or greater" do
      auction = Auction.new auction_attributes({amount: -10})
      expect(auction).to be_invalid
    end

    it "has a reserve" do
      auction = Auction.new auction_attributes({reserve: nil})
      expect(auction).to be_invalid
    end

    it "has a closing_date" do
      auction = Auction.new auction_attributes({closing_date: nil})
      expect(auction).to be_invalid
    end
  end
end
