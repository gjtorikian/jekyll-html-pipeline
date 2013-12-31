require "rubygems"

require "jekyll"
require "liquid"
require "html/pipeline"

require "jekyll/html/pipeline"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.expand_path("../support", __FILE__) + "/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include Jekyll::AssetsPlugin::RSpecHelpers

  config.before(:all) do
    Jekyll.logger.log_level = Jekyll::Stevenson::WARN

    @dest = fixtures_path.join("_site")
    @site = Jekyll::Site.new(Jekyll.configuration({
      "source"      => fixtures_path.to_s,
      "destination" => @dest.to_s
    }))

    @dest.rmtree if @dest.exist?
    @site.process
  end

  config.after(:all) do
    @dest.rmtree if @dest.exist?
  end
end
