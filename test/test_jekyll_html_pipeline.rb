require "helper"

class HTMLPipeline < Test::Unit::TestCase
  context "html_pipeline" do
    setup do
      @config = {
        'html_pipeline' => {
          'filters' => ['markdownfilter', 'sanitizationfilter', 'emojifilter', 'mentionfilter'],
          'context' => { 'asset_root' => "http://foo.com/icons", 'base_url' => "https://github.com/"}},
        'markdown' => 'HTMLPipeline'
      }
      @markdown = Jekyll::Converters::Markdown.new @config
    end

    should "pass regular options" do
      assert_equal "<h1>Some Header</h1>", @markdown.convert('# Some Header #').strip
    end

    should "pass rendering emoji" do
      assert_equal "<p><img class=\"emoji\" title=\":trollface:\" alt=\":trollface:\" src=\"http://foo.com/icons/emoji/trollface.png\" height=\"20\" width=\"20\" align=\"absmiddle\"></p>", @markdown.convert(':trollface:').strip
    end

    should "pass rendering mentions" do
      assert_equal "<p><strong>Hey, <a href=\"https://github.com/mojombo\" class=\"user-mention\">@mojombo</a></strong>!</p>", @markdown.convert('**Hey, @mojombo**!').strip
    end

    should "fail when a library dependency is not met" do
      override = @config.dup
      override['html_pipeline']['filters'] << 'AutolinkFilter'
      markdown = Jekyll::Converters::Markdown.new override
      assert_raise(LoadError) { markdown.convert('http://www.github.com') }
    end

    should "fail when a context dependency is not met" do
      override = @config.dup
      override['html_pipeline'].delete 'context'
      markdown = Jekyll::Converters::Markdown.new override
      assert_raise(ArgumentError) { markdown.convert(':trollface:') }
    end
  end
end
