# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "restet/version"

Gem::Specification.new do |s|
  s.name        = "restet"
  s.version     = Restet::VERSION
  s.authors     = ["Scott Holden"]
  s.email       = ["ssh@sshconnection.com"]
  s.homepage    = "http://github.com/sholden/restet"
  s.summary     = %q{A RESTful API exposing PDFlib TET functionality}
  s.description = %q{Provides a very simple extraction resource for extracing text from slices of a PDF.}

  s.rubyforge_project = "restet"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency 'multipart-post'
  s.add_runtime_dependency 'yajl-ruby'
  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'vegas'
end
