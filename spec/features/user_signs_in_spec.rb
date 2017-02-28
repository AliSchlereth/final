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
      expect(page).to have_content("You have signed in.")
    end

    it "does not log in a user without an email" do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")

      visit login_path
      fill_in "password", with: user.password
      click_on "Submit"

      expect(page).to have_content("Log In Unsuccessful. Please try again.")
    end

    it "does not log in a user without a password" do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")

      visit login_path

      fill_in "email", with: user.email
      click_on "Submit"

      expect(page).to have_content("Log In Unsuccessful. Please try again.")
    end

    it "does not log in a user without an account" do
      visit login_path

      fill_in "email", with: "email@email.com"
      fill_in "password", with: "password"
      click_on "Submit"

      expect(page).to have_content("Log In Unsuccessful. Please try again.")
    end


  end
end
