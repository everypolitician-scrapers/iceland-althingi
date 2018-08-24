# frozen_string_literal: true
require 'scraped'

class IcelandicMembersPage < Scraped::HTML
  decorator Scraped::Response::Decorator::CleanUrls

  field :member_urls do
    noko.xpath('//table[@id="t_thingmenn"]/tbody/tr/td/span/a/@href')
        .map(&:text)
  end
end
