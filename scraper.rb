require 'pry'
require 'require_all'
require 'scraped'
require 'scraped_page_archive/open-uri'

require_rel 'lib'

# url = 'http://www.althingi.is/altext/cv/en/'
urls = ['http://www.althingi.is/thingmenn/althingismenn/', # members
        'http://www.althingi.is/thingmenn/thingmenn/varamenn-sem-sitja-a-althingi/', # alternates
        'http://www.althingi.is/thingmenn/thingmenn/varamenn-sem-hafa-tekid-saeti/'] # substitues

urls.each do |url|
  IcelandicMembersPage.new(response: Scraped::Request.new(url: url).response)
             .member_urls
             .each do |url|
               puts "Opening: #{url}"
               Scraped::HTML.new(response: Scraped::Request.new(url: url).response)
             end
end
