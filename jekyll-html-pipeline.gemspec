Gem::Specification.new do |spec|
  spec.name          = "jekyll-html-pipeline"
  spec.version       = "0.1.4"
  spec.authors       = ["Garen Torikian"]
  spec.email         = ["gjtorikian@gmail.com"]
  spec.summary       = %q{Use GitHub's HTML::Pipeline, in Jekyll!}
  spec.description   = %q{This is a custom Markdown processor for Jekyll 2.0 and above. It allows you to use GitHub's HTML::Pipeline in your Jekyll projects. }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", ">= 2.0"
  spec.add_dependency 'html-pipeline', ">= 1.0"

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest', "~> 5.0"
  spec.add_development_dependency 'github-markdown', "~> 0.6.3"
  spec.add_development_dependency 'sanitize', "~> 2.0.6"

end
