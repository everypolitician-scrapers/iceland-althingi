# frozen_string_literal: true
require 'minitest/autorun'
require 'minitest-vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'tests/cassettes'
  c.hook_into :webmock
end

MinitestVcr::Spec.configure!
