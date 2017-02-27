require "rails_helper"

describe "Hot Reads is Updated" do
  it "sends an api post request to Hot Reads" do
    a = Link.create(url: "https://a.com", title: "title")
    b = Link.create(url: "https://b.com", title: "title")
    d = Link.create(url: "https://d.com", title: "title")

    service = HotReadsService.new(a)
    response = service.update
    updated = JSON.parse(response.body)

    expect(response).to be_success
    expect(updated['message']).to eq("Updated Hot Reads")
  end
end
