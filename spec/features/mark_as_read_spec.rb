require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
    user.links.create(url:"https://turing.io", title:"Turing")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    within('.link .link_read') do
      expect(page).to have_text("false")
    end
    click_on "Mark as Read"
    sleep(2)
    within('.link .link_read') do
      expect(page).to have_text("true")
    end

  end

  scenario "Mark a link as unread" do
    user = User.create(email: "email@email.com", password: "password", password_confirmation: "password")
    user.links.create(url:"https://turing.io", title:"Turing", read: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    within('.link .link_read') do
      expect(page).to have_text("true")
    end
    click_on "Mark as Unread"
    sleep(2)
    within('.link .link_read') do
      expect(page).to have_text("false")
    end
  end

end
