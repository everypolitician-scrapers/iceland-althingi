# frozen_string_literal: true

require 'scraped'

class EnglishMembersPage < Scraped::HTML
  decorator Scraped::Response::Decorator::AbsoluteUrls

  field :member_urls do
    noko.xpath('//table[@id="members"]/tbody/tr/td/b/a/@href').map(&:text)
  end
end
