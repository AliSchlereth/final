class HotReadsService

  def initialize(link)
    @link = link
    @conn = Faraday.new(:url => 'https://quiet-cliffs-23046.herokuapp.com/api/v1/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def update
    response = @conn.post 'links', {link: @link.url}
    current_hot_reads = JSON.parse(response.body)['current_hot_reads']
    update_links(current_hot_reads)
    response
  end

  def update_links(current_hot_reads)
    hot_urls = scope_to_links(current_hot_reads)
    update_hot_statuses(hot_urls)
    update_top_link(current_hot_reads[0])
  end

  def scope_to_links(current_hot_reads)
    current_hot_reads.map do |hot_read|
      hot_read['url']
    end
  end

  def update_hot_statuses(hot_urls)
    Link.all.each do |link|
      if hot_urls.include?(link.url)
        link.update_attributes(hot_status: "hot")
      else
        link.update_attributes(hot_status: "reg")
      end
    end
  end

  def update_top_link(top_read)
    top = Link.find_by(url: top_read['url'])
    top.update_attributes(hot_status: "top link") if top
  end

end
