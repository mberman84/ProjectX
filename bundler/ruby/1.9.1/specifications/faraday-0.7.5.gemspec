# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{faraday}
  s.version = "0.7.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rick Olson"]
  s.date = %q{2011-10-04 00:00:00.000000000Z}
  s.description = %q{HTTP/REST API client library.}
  s.email = %q{technoweenie@gmail.com}
  s.files = ["test/adapters/live_test.rb", "test/adapters/logger_test.rb", "test/adapters/net_http_test.rb", "test/adapters/test_middleware_test.rb", "test/connection_test.rb", "test/env_test.rb", "test/helper.rb", "test/live_server.rb", "test/middleware_stack_test.rb", "test/request_middleware_test.rb", "test/response_middleware_test.rb"]
  s.homepage = %q{http://github.com/technoweenie/faraday}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{faraday}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{HTTP/REST API client library.}
  s.test_files = ["test/adapters/live_test.rb", "test/adapters/logger_test.rb", "test/adapters/net_http_test.rb", "test/adapters/test_middleware_test.rb", "test/connection_test.rb", "test/env_test.rb", "test/helper.rb", "test/live_server.rb", "test/middleware_stack_test.rb", "test/request_middleware_test.rb", "test/response_middleware_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>, ["~> 2.2.6"])
      s.add_runtime_dependency(%q<multipart-post>, ["~> 1.1.3"])
      s.add_runtime_dependency(%q<rack>, ["< 2", ">= 1.1.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
      s.add_development_dependency(%q<test-unit>, ["~> 2.4"])
      s.add_development_dependency(%q<webmock>, ["~> 1.7"])
    else
      s.add_dependency(%q<addressable>, ["~> 2.2.6"])
      s.add_dependency(%q<multipart-post>, ["~> 1.1.3"])
      s.add_dependency(%q<rack>, ["< 2", ">= 1.1.0"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
      s.add_dependency(%q<test-unit>, ["~> 2.4"])
      s.add_dependency(%q<webmock>, ["~> 1.7"])
    end
  else
    s.add_dependency(%q<addressable>, ["~> 2.2.6"])
    s.add_dependency(%q<multipart-post>, ["~> 1.1.3"])
    s.add_dependency(%q<rack>, ["< 2", ">= 1.1.0"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
    s.add_dependency(%q<test-unit>, ["~> 2.4"])
    s.add_dependency(%q<webmock>, ["~> 1.7"])
  end
end
