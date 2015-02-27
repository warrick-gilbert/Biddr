require 'rails_helper'

RSpec.describe Bid, type: :model do
  def bid_attributes(new_attributes ={})
    valid_attributes = {amount: 10
                      }
    valid_attributes.merge new_attributes
  end

  describe "Validations" do
    it "has an amount" do
      bid = Bid.new bid_attributes({amount: nil})
      expect(bid).to be_invalid
    end

  end
    
end
