require 'scraped'

class MembersPage < Scraped::HTML
  field :member_urls do
    noko.xpath('//table[@id="members"]/tbody/tr/td/b/a/@href').map do |row|
      URI.join(url,row.text).to_s
    end
  end
end
