require 'pry'
require 'require_all'
require 'scraped'
require 'scraped_page_archive/open-uri'

require_rel 'lib'

# url = 'http://www.althingi.is/altext/cv/en/'
# MembersPage.new(response: Scraped::Request.new(url: url).response)
#            .member_urls
#            .each do |url|
#              Scraped::HTML.new(response: Scraped::Request.new(url: url).response)
#              puts "Opening: #{url}"
#            end

icelandic_index_url = 'http://www.althingi.is/altext/cv/is'
list_pages = IcelandicCharacters.new(
  response: Scraped::Request.new(url: icelandic_index_url)
                            .response
).to_a
 .map do |letter|
  url = URI.join(icelandic_index_url, "?cstafur=#{URI.encode(letter)}").to_s
  puts "Opening listing page: #{url}"
  res = Scraped::Request.new(url: url)
                        .response
  IcelandicMembersPage.new(response: res).member_urls.each do |url|
    Scraped::HTML.new(response: Scraped::Request.new(url: url).response)
             puts "Opening member page: #{url}"
  end
end
