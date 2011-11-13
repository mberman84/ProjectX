# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{omniauth-facebook}
  s.version = "1.0.0.rc2"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Dodwell"]
  s.date = %q{2011-11-11 00:00:00.000000000Z}
  s.email = ["mark@mkdynamic.co.uk"]
  s.files = ["spec/omniauth/strategies/facebook_spec.rb", "spec/spec_helper.rb", "spec/support/shared_examples.rb"]
  s.homepage = %q{https://github.com/mkdynamic/omniauth-facebook}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Facebook strategy for OmniAuth}
  s.test_files = ["spec/omniauth/strategies/facebook_spec.rb", "spec/spec_helper.rb", "spec/support/shared_examples.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth-oauth2>, ["~> 1.0.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<omniauth-oauth2>, ["~> 1.0.0"])
      s.add_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<omniauth-oauth2>, ["~> 1.0.0"])
    s.add_dependency(%q<rspec>, ["~> 2.7.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
