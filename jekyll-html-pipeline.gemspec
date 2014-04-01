Gem::Specification.new do |spec|
  spec.name          = "jekyll-html-pipeline"
  spec.version       = "0.0.1"
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

  spec.add_dependency "jekyll",    "~> 2.0.0.alpha.1 "
  spec.add_dependency('html-pipeline', "~> 1.0.0")

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "rake"
  spec.add_development_dependency('shoulda', "~> 3.5")
  spec.add_development_dependency('github-markdown', "~> 0.6.3")
  spec.add_development_dependency('sanitize', "~> 2.0.6")
  spec.add_development_dependency('gemoji', "~> 1.5.0")
  spec.add_development_dependency "rouge"
end
