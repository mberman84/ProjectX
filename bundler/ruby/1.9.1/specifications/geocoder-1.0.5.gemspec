# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{geocoder}
  s.version = "1.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Reisner"]
  s.date = %q{2011-10-25}
  s.default_executable = %q{geocode}
  s.description = %q{Provides object geocoding (by street or IP address), reverse geocoding (coordinates to street address), distance queries for ActiveRecord and Mongoid, result caching, and more. Designed for Rails but works with Sinatra and other Rack frameworks too.}
  s.email = ["alex@alexreisner.com"]
  s.executables = ["geocode"]
  s.files = ["bin/geocode"]
  s.homepage = %q{http://www.rubygeocoder.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Complete geocoding solution for Ruby.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
