require "rails_helper"

describe "visitor tries to visit links index" do
  scenario "they are redirected to login path" do
    visit root_path

    expect(current_path).to eq(login_path)
  end
end
