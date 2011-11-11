# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gravatar_image_tag}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Deering"]
  s.date = %q{2011-01-15}
  s.email = %q{mdeering@mdeering.com}
  s.files = ["spec/gravatar_image_tag_spec.rb", "spec/test_helper.rb"]
  s.homepage = %q{http://github.com/mdeering/gravatar_image_tag}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A configurable and documented Rails view helper for adding gravatars into your Rails application.}
  s.test_files = ["spec/gravatar_image_tag_spec.rb", "spec/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
