# frozen_string_literal: true

require 'net/http'

class Scraper
  HEADING_SELECTORS = 'h1,h2,h3'

  def self.extract_headings(url)
    obj = new(url)
    obj.extract_text(HEADING_SELECTORS)
  end

  def initialize(url)
    @uri = URI.parse(url)
  end

  def extract_text(selector)
    body.css(selector).map(&:text)
  end

  private

  def body
    @body ||= begin
                response = Net::HTTP.get_response(@uri)
                Nokogiri::HTML(response.body)
              end
  end
end
