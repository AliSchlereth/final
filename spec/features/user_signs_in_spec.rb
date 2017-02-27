require "rails_helper"

describe "user signs in" do
  context "they visit the login path" do
    it "logs in a user" do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")

      visit login_path
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Submit"

      expect(current_path).to eq(root_path)
    end
  end
end
