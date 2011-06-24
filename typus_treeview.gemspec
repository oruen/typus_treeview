# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "typus_treeview/version"

Gem::Specification.new do |s|
  s.name        = "typus_treeview"
  s.version     = TypusTreeview::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nick Recobra"]
  s.email       = ["oruenu@gmail.com"]
  s.homepage    = "https://github.com/oruen/typus_treeview"
  s.summary     = %q{Typus extension implementing Treeview.}
  s.description = %q{Implements treeview via jquery.treeview for models using acts_as_tree.}

  s.rubyforge_project = "typus_treeview"
  s.add_dependency 'typus', '>= 3.0.4'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
