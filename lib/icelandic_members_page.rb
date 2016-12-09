require 'scraped'

class IcelandicMembersPage < Scraped::HTML
  field :member_urls do
    noko.xpath('//div[@class="pgmain"]/ul/li/a/@href').map do |row|
      URI.join(url, row.text).to_s
    end
  end
end
