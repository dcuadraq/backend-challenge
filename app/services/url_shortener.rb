class UrlShortener
  def self.shorten(url)
    obj = new
    obj.shorten(url)
  end

  def shorten(url)
    client.shorten(long_url: url).link
  end

  def client
    @client ||= begin
                  token = Rails.application.credentials.bitly_token
                  Bitly::API::Client.new(token: token)
                end
  end
end
