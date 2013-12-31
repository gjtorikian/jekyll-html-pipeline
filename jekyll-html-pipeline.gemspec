# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/html/pipeline/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-html-pipeline"
  spec.version       = Jekyll::Html::Pipeline::VERSION
  spec.authors       = ["Garen Torikian"]
  spec.email         = ["gjtorikian@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll",    "~> 1.4.2"
  spec.add_dependency('html-pipeline', "~> 1.0.0")

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency('github-markdown', "~> 0.6.3")
  spec.add_development_dependency('sanitize', "~> 2.0.6")
  spec.add_development_dependency('gemoji', "~> 1.5.0")
end
