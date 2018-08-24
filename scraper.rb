# frozen_string_literal: true
require 'pry'
require 'require_all'
require 'scraped'
require 'scraped_page_archive/open-uri'

require_rel 'lib'

members_pages = {
  EnglishMembersPage   => ['https://www.althingi.is/altext/cv/en/'],
  IcelandicMembersPage => [
    'https://www.althingi.is/thingmenn/althingismenn/',
    'https://www.althingi.is/thingmenn/thingmenn/varamenn-sem-sitja-a-althingi/',
    'https://www.althingi.is/thingmenn/thingmenn/varamenn-sem-hafa-tekid-saeti/',
  ],
}

def scraped_page_for(url, klass = Scraped::HTML)
  klass.new(response: Scraped::Request.new(url: url).response)
end

members_pages.each do |key, page_urls|
  page_urls.each do |page_url|
    scraped_page_for(page_url, key).member_urls.each do |member_url|
      _ = scraped_page_for(member_url)
    end
  end
end
