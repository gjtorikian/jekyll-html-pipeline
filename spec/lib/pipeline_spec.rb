require "spec_helper"

module Jekyll::Converters
  describe Markdown::HTMLPipeline do
    let(:context) { { :registers => { :site => @site } } }

    def render content
      Liquid::Template.parse(content).render({}, context)
    end

    it "should pass regular options" do
      assert_equal "<h1>Some Header</h1>", @markdown.convert('# Some Header #').strip
    end

    it "should pass rendering emoji" do
      assert_equal "<p><img class=\"emoji\" title=\":trollface:\" alt=\":trollface:\" src=\"http://foo.com/icons/emoji/trollface.png\" height=\"20\" width=\"20\" align=\"absmiddle\"></p>", @markdown.convert(':trollface:').strip
    end

    it "should pass rendering mentions" do
      assert_equal "<p><strong>Hey, <a href=\"https://github.com/mojombo\" class=\"user-mention\">@mojombo</a></strong>!</p>", @markdown.convert('**Hey, @mojombo**!').strip
    end

    # should "fail when a library dependency is not met" do
    #   override = { 'html_pipeline' => { 'filters' => ['markdownfilter, AutolinkFilter'] } }
    #   markdown = Converters::Markdown.new(@config.deep_merge(override))
    #   # assert_fail markdown.convert('http://www.github.com')
    # end
    #
    # should "fail when a context dependency is not met" do
    #   override = { 'html_pipeline' => { 'context' => {} } }
    #   markdown = Converters::Markdown.new(@config.deep_merge(override))
    #   # assert_fail markdown.convert(':trollface:')
    # end
  end
end
