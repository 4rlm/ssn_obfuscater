require "bundler/gem_tasks"
require "rspec/core/rake_task"

require 'ssn_obfuscater'
# require 'webs_criteria'


RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :test => :spec

###################
task :console do
  require 'irb'
  require 'irb/completion'
  require 'ssn_obfuscater'
  require "active_support/all"
  ARGV.clear

  result_hash = run_ssn

  IRB.start
end


def run_ssn
  text = "Dillan Richmond Gorczany, 8/16/1954, 000-12-3456, richmond.gorczany.dillan@jacobs.io, 405.226.5344, 2012 Erling Pass, Eagle Square, East Dwight, PA, 25733, Dynamic Manufacturing, VP of Tech"

  result_hash = SsnObfuscater.parse(text: text)
  # scraper = LinkScraper::Scrape.new(WebsCriteria.all_scrub_web_criteria)
end
