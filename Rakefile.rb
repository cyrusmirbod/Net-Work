require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
time = Time.now.strftime("%d/%m/%Y %H:%M")
  t.cucumber_opts = "features --tags ~@login --format pretty  --format json --out report/cucumber_results.json"
end

Cucumber::Rake::Task.new(:createabcdsurvey) do |t|
time = Time.now.strftime("%d/%m/%Y %H:%M")
  t.cucumber_opts = "features/createabcdsurvey.feature --tags ~@login --format pretty  --format json --out report/cucumber_results.json"
end

	