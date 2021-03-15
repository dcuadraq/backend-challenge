require 'test_helper'

class UrlShortenerTest < ActiveSupport::TestCase
  test '#shorten returns string' do
    original_url = 'https://en.wikipedia.org/wiki/Yukihiro_Matsumoto'
    short_url = UrlShortener.shorten(original_url)
    assert_equal short_url, 'https://bit.ly/3bJulz1'
  end
end
