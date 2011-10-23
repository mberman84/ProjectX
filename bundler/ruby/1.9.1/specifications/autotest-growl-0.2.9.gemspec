# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{autotest-growl}
  s.version = "0.2.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sven Schwyn"]
  s.date = %q{2010-12-08}
  s.description = %q{This gem aims to improve support for Growl notifications by autotest.}
  s.email = ["ruby@bitcetera.com"]
  s.files = ["spec/autotest-growl_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://www.bitcetera.com/products/autotest-growl}
  s.post_install_message = %q{[1;32m
-------------------------------------------------------------------------------

In order to use autotest-growl, install either the comprehensive 
ZenTest gem or the lightweight autotest-standalone gem and then add the 
following line to your ~/.autotest file:

require 'autotest/growl'

Make sure the notification service installed on your computer:

http://growl.info (Growl for Mac OS X)
http://growlforwindows.com (Growl for Windows)
http://www.galago-project.org (libnotify for Linux)

If Growl notifications are not always displayed, take a look at the README
for assistance.

For more information, feedback and bug submissions, please visit:

http://www.bitcetera.com/products/autotest-growl

If you like this gem, please consider to recommend me on Working with
Rails, thank you!

http://workingwithrails.com/recommendation/new/person/11706-sven-schwyn

-------------------------------------------------------------------------------
[0m}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{autotest-growl}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Growl notification support for autotest}
  s.test_files = ["spec/autotest-growl_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<ZenTest>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<ZenTest>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<ZenTest>, [">= 0"])
  end
end
