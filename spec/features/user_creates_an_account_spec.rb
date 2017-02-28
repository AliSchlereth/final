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
      expect(page).to have_content("You have successfully signed up.")
    end

    it "does not enter an email address" do
      visit signup_path

      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Submit"

      expect(page).to have_content("Email can't be blank")
    end

    it "does not enter a password" do
      visit signup_path

      fill_in "user[email]", with: "email@email.com"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Submit"

      expect(page).to have_content("Password can't be blank")
    end

    it "does not enter a password confirmation" do
      visit signup_path

      fill_in "user[email]", with: "email@email.com"
      fill_in "user[password]", with: "password"
      click_on "Submit"

      expect(page).to have_content("Password confirmation doesn't match Password")
    end

  end
end
