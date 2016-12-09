require 'pry'
require 'require_all'
require 'scraped'
require 'scraped_page_archive/open-uri'

require_rel 'lib'

url = 'http://www.althingi.is/altext/cv/en/'
MembersPage.new(response: Scraped::Request.new(url: url).response)
           .member_urls
           .each do |url|
             Scraped::HTML.new(response: Scraped::Request.new(url: url).response)
             puts "Opening: #{url}"
           end
