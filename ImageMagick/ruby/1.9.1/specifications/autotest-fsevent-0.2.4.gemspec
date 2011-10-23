# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{autotest-fsevent}
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sven Schwyn"]
  s.date = %q{2010-12-01}
  s.description = %q{Autotest relies on filesystem polling to detect modifications in source code files. This is expensive for the CPU, harddrive and battery - and unnecesary on Mac OS X 10.5 or higher which comes with the very efficient FSEvent core service for this very purpose. This gem teaches autotest how to use FSEvent.}
  s.email = ["ruby@bitcetera.com"]
  s.extensions = ["ext/fsevent/extconf.rb"]
  s.files = ["spec/autotest-fsevent_spec.rb", "spec/spec_helper.rb", "ext/fsevent/extconf.rb"]
  s.homepage = %q{http://www.bitcetera.com/products/autotest-fsevent}
  s.post_install_message = %q{[1;32m
-------------------------------------------------------------------------------

In order to use autotest-fsevent, install either the comprehensive 
ZenTest gem or the lightweight autotest-standalone gem and then add the 
following line to your ~/.autotest file:

require 'autotest/fsevent'

For more information, feedback and bug submissions, please visit:

http://www.bitcetera.com/products/autotest-fsevent

If you like this gem, please consider to recommend me on Working with
Rails, thank you!

http://workingwithrails.com/recommendation/new/person/11706-sven-schwyn

-------------------------------------------------------------------------------
[0m}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{autotest-fsevent}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Use FSEvent (on Mac OS X 10.5 or higher) instead of filesystem polling.}
  s.test_files = ["spec/autotest-fsevent_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sys-uname>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<ZenTest>, [">= 0"])
    else
      s.add_dependency(%q<sys-uname>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<ZenTest>, [">= 0"])
    end
  else
    s.add_dependency(%q<sys-uname>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<ZenTest>, [">= 0"])
  end
end
