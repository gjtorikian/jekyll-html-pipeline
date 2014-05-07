require "test_helper"

class HTMLPipelineTest < Converter::HTMLPipelineTestCase
  def setup
    @config = {
      'html_pipeline' => {
        'filters' => ['markdownfilter', 'sanitizationfilter', 'emojifilter', 'mentionfilter'],
        'context' => { 'asset_root' => "http://foo.com/icons", 'base_url' => "https://github.com/"}},
      'markdown' => 'HTMLPipeline'
    }
    @markdown = Jekyll::Converters::Markdown.new @config
  end

  def test_passes_regular_options
    assert_equal "<h1>Some Header</h1>", @markdown.convert('# Some Header #').strip
  end

  def test_pass_rendering_emoji
    assert_equal "<p><img class=\"emoji\" title=\":trollface:\" alt=\":trollface:\" src=\"http://foo.com/icons/emoji/trollface.png\" height=\"20\" width=\"20\" align=\"absmiddle\"></p>", @markdown.convert(':trollface:').strip
  end

  def test_pass_rendering_mentions
    assert_equal "<p><strong>Hey, <a href=\"https://github.com/mojombo\" class=\"user-mention\">@mojombo</a></strong>!</p>", @markdown.convert('**Hey, @mojombo**!').strip
  end

  def test_fail_when_a_library_dependency_is_not_met
    override = @config.dup
    override['html_pipeline']['filters'] << 'AutolinkFilter'
    markdown = Jekyll::Converters::Markdown.new override
    assert_raises(LoadError) { markdown.convert('http://www.github.com') }
  end

  def test_fail_when_a_context_dependency_is_not_met
    override = @config.dup
    override['html_pipeline'].delete 'context'
    markdown = Jekyll::Converters::Markdown.new override
    assert_raises(ArgumentError) { markdown.convert(':trollface:') }
  end

  def test_work_for_custom_filters
    require 'support/new_pipeline'
    override = @config.dup
    override['html_pipeline']['filters'] = ['HelpMarkdownFilter']
    markdown = Jekyll::Converters::Markdown.new override
    text = "\n {{#tip}}\n **Tip**: Wow! \n {{/tip}}"
    assert_equal "<div class=\"alert tip\"><br>\n <strong>Tip</strong>: Wow! <br>\n </div>", markdown.convert(text)
  end
end
