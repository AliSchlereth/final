require "rails_helper"

describe "user creates an account" do
  context "they visit the signup page" do
    it "enters user information" do
      visit signup_path

      fill_in "user[email]", with: "email@email.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Submit"

      expect(current_path).to eq(root_path)
    end
  end
end
