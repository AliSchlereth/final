require "rails_helper"

describe "user signs out" do
  context "they click sign out from the root path" do
    it "signs them out and redirects to login" do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on "Sign Out"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("You have signed out.")
    end
  end
end
