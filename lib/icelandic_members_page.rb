# frozen_string_literal: true
require 'scraped'

class IcelandicMembersPage < Scraped::HTML
  field :member_urls do
    noko.xpath('//table[@id="t_thingmenn"]/tbody/tr/td/span/a/@href')
        .map do |row|
      URI.join(url, row.text).to_s
    end
  end
end
