require 'scraped'

class IcelandicCharacters < Scraped::HTML

  field :to_a do
    noko.xpath('//div[@class="pgmain"]/p/a/text()').map(&:text)
  end
end
