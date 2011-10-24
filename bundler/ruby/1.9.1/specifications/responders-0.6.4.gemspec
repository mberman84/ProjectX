# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{responders}
  s.version = "0.6.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["José Valim"]
  s.date = %q{2011-05-06}
  s.description = %q{A set of Rails 3 responders to dry up your application}
  s.email = %q{contact@plataformatec.com.br}
  s.files = ["test/collection_responder_test.rb", "test/controller_method_test.rb", "test/flash_responder_test.rb", "test/http_cache_responder_test.rb", "test/locales/en.yml", "test/test_helper.rb", "test/views/addresses/create.js.erb", "test/views/addresses/edit.html.erb", "test/views/addresses/new.html.erb"]
  s.homepage = %q{http://github.com/plataformatec/responders}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{responders}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A set of Rails 3 responders to dry up your application}
  s.test_files = ["test/collection_responder_test.rb", "test/controller_method_test.rb", "test/flash_responder_test.rb", "test/http_cache_responder_test.rb", "test/locales/en.yml", "test/test_helper.rb", "test/views/addresses/create.js.erb", "test/views/addresses/edit.html.erb", "test/views/addresses/new.html.erb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
