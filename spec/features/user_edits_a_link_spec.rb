require "rails_helper"

describe "user edits a link" do
  context "they link from the links index" do
    it "shows an edit form for selected link" do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      link1 = user.links.create(url: "https://link1.com", title: "test link 1")
      link2 = user.links.create(url: "https://link2.com", title: "test link 2")

      visit "/"
      within("#link-#{link1.id}") do
        click_on "Edit"
      end

      expect(current_path).to eq(edit_link_path(link1))
    end

    it "updates valid link information" do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      link1 = user.links.create(url: "https://link1.com", title: "test link 1")

      visit edit_link_path(link1)
      fill_in "link[url]", with: "https://updated.com"
      fill_in "link[title]", with: "Updated Title"
      click_on "Update Link"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Updated Title")
      expect(page).to have_content("https://updated.com")
    end

    it "does not update invalid link information" do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      link1 = user.links.create(url: "https://link1.com", title: "test link 1")

      visit edit_link_path(link1)
      fill_in "link[url]", with: "updated.com"
      fill_in "link[title]", with: "Updated Title"
      click_on "Update Link"

      expect(current_path).to_not eq(root_path)
      expect(page).to have_content("Url is not a valid URL")
    end

    it "does not update invalid title" do
      user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      link1 = user.links.create(url: "https://link1.com", title: "test link 1")

      visit edit_link_path(link1)
      fill_in "link[url]", with: "https://updated.com"
      fill_in "link[title]", with: ""
      click_on "Update Link"

      expect(current_path).to_not eq(root_path)
      expect(page).to have_content("Title can't be blank")
    end
  end
end
