require 'pry'
require 'require_all'
require 'scraped'
require 'scraped_page_archive/open-uri'

require_rel 'lib'

# url = 'http://www.althingi.is/altext/cv/en/'
icelandic_urls = {
        members: 'http://www.althingi.is/thingmenn/althingismenn/',
        alternates: 'http://www.althingi.is/thingmenn/thingmenn/varamenn-sem-sitja-a-althingi/',
        substitues: 'http://www.althingi.is/thingmenn/thingmenn/varamenn-sem-hafa-tekid-saeti/'
        }

icelandic_urls.each do |key, url|
  IcelandicMembersPage.new(response: Scraped::Request.new(url: url).response)
             .member_urls
             .each do |url|
               Scraped::HTML.new(response: Scraped::Request.new(url: url).response)
             end
end
