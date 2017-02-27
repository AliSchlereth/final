require "rails_helper"

describe "user edits a link" do
  context "they link from the links indes" do
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
  end
end
