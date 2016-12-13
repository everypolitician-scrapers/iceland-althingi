require 'pry'
require 'require_all'
require 'scraped'
require 'scraped_page_archive/open-uri'

require_rel 'lib'

urls = {
  EnglishMembersPage => ['http://www.althingi.is/altext/cv/en/'],
  IcelandicMembersPage => [
    'http://www.althingi.is/thingmenn/althingismenn/',
    'http://www.althingi.is/thingmenn/thingmenn/varamenn-sem-sitja-a-althingi/',
    'http://www.althingi.is/thingmenn/thingmenn/varamenn-sem-hafa-tekid-saeti/'
  ]
}

def scraped_page_for(url, klass = Scraped::HTML)
  klass.new(response: Scraped::Request.new(url: url).response)
end

urls.each do |key, urls|
  urls.each do |url|
    scraped_page_for(url, key)
      .member_urls
      .each do |url|
      _ = scraped_page_for(url)
    end
  end
end
