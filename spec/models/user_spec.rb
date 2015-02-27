require 'rails_helper'

RSpec.describe User, type: :model do
  def user_attributes(new_attributes = {})
    valid_attributes = {username: "Jimbo",
                        password_digest: "12345678"}
    valid_attributes.merge new_attributes
  end

  describe "Validations" do
    it "requires an username" do
      user = User.new user_attributes({username: nil})
      expect(user).to be_invalid
    end
    
    it "requires an password_digest" do
      user = User.new user_attributes({password_digest: nil})
      expect(user).to be_invalid
    end

    # it "requires a password" do
    #   User.create(user_attributes)
    #   user = User.new(user_attributes)
    #   expect(user).to be_invalid
    # end

    # it "requires an email with a valid format" do
    #   user = User.new(user_attributes({email: "bob@gmail"}))
    #   expect(user).to be_invalid
    # end
  end
end
