# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sass-on-heroku}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tomasz Mazur"]
  s.date = %q{2010-02-19}
  s.email = %q{defkode@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/rack", "lib/rack/sass_on_heroku.rb", "lib/sass_on_heroku.rb", "lib/version.rb", "test/test_helper.rb", "test/unit", "test/unit/sass_on_heroku_test.rb"]
  s.homepage = %q{http://defkode.com}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{This gem does ...}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
