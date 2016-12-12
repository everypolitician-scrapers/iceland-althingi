require 'pry'
require 'require_all'
require 'scraped'
require 'scraped_page_archive/open-uri'

require_rel 'lib'

english_url = 'http://www.althingi.is/altext/cv/en/'
icelandic_urls = {
        members: 'http://www.althingi.is/thingmenn/althingismenn/',
        alternates: 'http://www.althingi.is/thingmenn/thingmenn/varamenn-sem-sitja-a-althingi/',
        substitues: 'http://www.althingi.is/thingmenn/thingmenn/varamenn-sem-hafa-tekid-saeti/'
        }

def scraped_page_for(url)
  Scraped::HTML.new(response: Scraped::Request.new(url: url).response)
end

EnglishMembersPage.new(response: Scraped::Request.new(url: english_url).response)
                  .member_urls
                  .each do |url|
                    _ = scraped_page_for(url)
                  end

icelandic_urls.each do |key, url|
  IcelandicMembersPage.new(response: Scraped::Request.new(url: url).response)
             .member_urls
             .each do |url|
               _ = scraped_page_for(url)
             end
end
