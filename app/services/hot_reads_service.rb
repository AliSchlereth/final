class HotReadsService

  def initialize(link)
    @link = link
    @conn = Faraday.new(:url => 'https://quiet-cliffs-23046.herokuapp.com/api/v1/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def update
    @conn.post 'links', {link: @link.url}
  end


end
