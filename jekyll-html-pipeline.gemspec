# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-html-pipeline'
  spec.version       = '1.1.1'
  spec.authors       = ['Garen Torikian']
  spec.email         = ['gjtorikian@gmail.com']
  spec.summary       = "Use GitHub's HTML::Pipeline, in Jekyll!"
  spec.description   = "This is a custom Markdown processor for Jekyll 2.0 and above. It allows you to use GitHub's HTML::Pipeline in your Jekyll projects. "
  spec.homepage      = 'https://github.com/gjtorikian/jekyll-html-pipeline'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'jekyll', '~> 3.0'
  spec.add_dependency 'html-pipeline', '~> 2.8'

  spec.add_development_dependency 'commonmarker', '~> 0.17'
  spec.add_development_dependency 'gemoji', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-standard'
  spec.add_development_dependency 'sanitize', '~> 2.0.6'
end
