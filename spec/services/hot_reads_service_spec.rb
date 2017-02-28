require "rails_helper"

describe "Hot Reads requests" do
  context "Hot Reads is Updated" do
    it "sends an api post request to Hot Reads" do
      a = Link.create(url: "https://a.com", title: "title")
      b = Link.create(url: "https://b.com", title: "title")
      d = Link.create(url: "https://d.com", title: "title")
      turing = Link.create(url: "https://turing.io", title: "Turing")

      service = HotReadsService.new(a)
      response = service.update
      updated = JSON.parse(response.body)

      expect(response).to be_success
      expect(updated['message']).to eq("Updated Hot Reads")
    end
  end

  context "Hot Read Service Methods" do
    it "scopes to links" do
      a = Link.create(url: "https://a.com", title: "title")
      service = HotReadsService.new(a)
      current_hot_reads = [{"id"=>1, "url"=>"https://a.com", "count"=>42, "created_at"=>"2017-02-27T21:28:26.170Z", "updated_at"=>"2017-02-28T02:45:35.882Z"},
                           {"id"=>2, "url"=>"https://turing.io", "count"=>41, "created_at"=>"2017-02-27T21:29:14.946Z", "updated_at"=>"2017-02-28T02:49:59.690Z"}]
      links = service.scope_to_links(current_hot_reads)
      expect(links).to eq(["https://a.com", "https://turing.io"])
    end

    it "update_hot_statuses" do
      a = Link.create(url: "https://a.com", title: "title")
      turing = Link.create(url: "https://turing.io", title: "title")
      service = HotReadsService.new(a)
      hot_urls = ["https://a.com", "https://turing.io"]
      service.update_hot_statuses(hot_urls)

      expect(Link.first.hot_status).to eq("hot")
      expect(Link.last.hot_status).to eq("hot")
    end

    it "update_hot_statuses" do
      a = Link.create(url: "https://a.com", title: "title")
      turing = Link.create(url: "https://turing.io", title: "title")
      service = HotReadsService.new(a)
      top_read = {'url' => "https://turing.io"}
      service.update_top_link(top_read)
      expect(Link.last.hot_status).to eq("top link")
    end
  end
end
