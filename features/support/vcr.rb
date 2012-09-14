require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'features/support/vcr_cassettes'
  c.hook_into :webmock
  c.debug_logger = File.open('log.txt', 'w')
end

VCR.cucumber_tags do |t|
  t.tag '@gemfile'#, use_scenario_name: true 
end