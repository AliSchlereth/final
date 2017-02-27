require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it "is invalid with duplicate emails" do
      user1 = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
      user2 = User.new(email: "email@email.com", password: "password", password_confirmation: "password")

      expect(user2).to_not be_valid
    end
  end
end
