# frozen_string_literal: true
require_relative './test_helper'
require_relative '../lib/icelandic_members_page.rb'

describe IcelandicMembersPage do
  around { |test| VCR.use_cassette('IcelandicMembersPage', &test) }

  url = 'http://www.althingi.is/thingmenn/althingismenn/'

  describe 'member_urls' do
    it 'should return the expected number of urls' do
      IcelandicMembersPage.new(response: Scraped::Request.new(url: url)
                                                         .response)
                          .member_urls
                          .count
                          .must_equal 63
    end
  end

  describe 'member_urls' do
    it 'should return an expected url in its result' do
      IcelandicMembersPage.new(response: Scraped::Request.new(url: url)
                                                         .response)
                          .member_urls
                          .must_include 'http://www.althingi.is/' \
                                        'altext/cv/is/?nfaerslunr=1265'
    end
  end
end
