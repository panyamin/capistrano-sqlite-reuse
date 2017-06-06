# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "capistrano/sqlite-reuse/version"

Gem::Specification.new do |gem|
  gem.name          = "capistrano-sqlite-reuse"
  gem.version       = Capistrano::SqliteReuse::VERSION
  gem.authors       = ["Mike Crockett"]
  gem.email         = ["rubygems@mmcrockett.com"]
  gem.description   = <<-EOF.gsub(/^\s+/, "")
    Capistrano tasks for automating linking a sqlite db in Rails 4+.

    If a database is already found on remote server, then it copies to shared
    location and links, otherwise it lets other task generate db.
  EOF
  gem.summary       = "Capistrano tasks for automating linking a sqlite database."
  gem.homepage      = "https://github.com/mmcrockett/capistrano-sqlite-reuse"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.licenses      = ['MIT']

  gem.add_dependency "capistrano", "~> 3.1"
  gem.add_development_dependency "rake", "~> 0"
end
