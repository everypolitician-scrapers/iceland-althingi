require 'minitest/autorun'
require_relative '../lib/english_members_page.rb'

describe EnglishMembersPage do
  describe 'member_urls' do
    it 'should return the expected number of urls' do
      url = 'http://www.althingi.is/altext/cv/en/'
      EnglishMembersPage.new(response: Scraped::Request.new(url:url).response)
                        .member_urls
                        .count
                        .must_equal 63
    end
  end

  describe 'member_urls' do
    it 'should return an expected url in its result' do
            url = 'http://www.althingi.is/altext/cv/en/'
            EnglishMembersPage.new(response: Scraped::Request.new(url:url).response)
                        .member_urls
                        .must_include 'http://www.althingi.is/altext/cv/en/?nfaerslunr=182'
    end
  end
end