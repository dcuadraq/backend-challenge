require 'test_helper'

class ScraperTest < ActiveSupport::TestCase
  test '#extract_headings' do
    url = 'https://en.wikipedia.org/wiki/Yukihiro_Matsumoto'
    headings = Scraper.extract_headings(url).join(', ')
    assert_includes headings, 'Ruby'
  end
end
