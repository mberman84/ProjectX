# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{has_scope}
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["José Valim"]
  s.date = %q{2011-08-01}
  s.description = %q{Maps controller filters to your resource scopes}
  s.email = %q{developers@plataformatec.com.br}
  s.files = ["test/has_scope_test.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/plataformatec/has_scope}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{has_scope}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Maps controller filters to your resource scopes.}
  s.test_files = ["test/has_scope_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
