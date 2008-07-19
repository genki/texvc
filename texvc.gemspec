Gem::Specification.new do |s|
  s.name = %q{texvc}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Genki Takiuchi"]
  s.autorequire = %q{}
  s.date = %q{2008-07-19}
  s.description = %q{}
  s.email = %q{genki@s21g.com}
  s.extra_rdoc_files = ["README", "ChangeLog"]
  s.files = ["README", "ChangeLog", "Rakefile", "test/test_helper.rb", "test/texvc_test.rb", "lib/texvc.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://texvc.rubyforge.org}
  s.rdoc_options = ["--title", "texvc documentation", "--charset", "utf-8", "--opname", "index.html", "--line-numbers", "--main", "README", "--inline-source", "--exclude", "^(examples|extras)/"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{texvc}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{}
  s.test_files = ["test/texvc_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<escape>, [">= 0.0.4"])
      s.add_runtime_dependency(%q<rmagick>, [">= 0"])
      s.add_runtime_dependency(%q<tempdir>, [">= 0"])
      s.add_runtime_dependency(%q<redgreen>, [">= 1.2.2"])
    else
      s.add_dependency(%q<escape>, [">= 0.0.4"])
      s.add_dependency(%q<rmagick>, [">= 0"])
      s.add_dependency(%q<tempdir>, [">= 0"])
      s.add_dependency(%q<redgreen>, [">= 1.2.2"])
    end
  else
    s.add_dependency(%q<escape>, [">= 0.0.4"])
    s.add_dependency(%q<rmagick>, [">= 0"])
    s.add_dependency(%q<tempdir>, [">= 0"])
    s.add_dependency(%q<redgreen>, [">= 1.2.2"])
  end
end
