require "rails_helper"

describe "user filters links" do
  context "they visit the links index" do
    it "clicks read", js: true do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
      link1 = user.links.create(url:"https://x.io", title:"Turing", read: true)
      link2 = user.links.create(url:"https://y.io", title:"Turing", read: false)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_button "Read"

      expect(page).to have_content("https://x.io")
      expect(page).to_not have_content("https://y.io")
    end

    it "clicks unread", js: true do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
      link1 = user.links.create(url:"https://x.io", title:"Turing", read: true)
      link2 = user.links.create(url:"https://y.io", title:"Turing", read: false)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_button "UnRead"

      expect(page).to have_content("https://y.io")
      expect(page).to_not have_content("https://x.io")
    end

    it "clicks unread", js: true do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
      link1 = user.links.create(url:"https://x.io", title:"Turing", read: true)
      link2 = user.links.create(url:"https://y.io", title:"Turing", read: false)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      fill_in "filter-input", with: "y"

      expect(page).to have_content("https://y.io")
      expect(page).to_not have_content("https://x.io")
    end
  end
end
