# frozen_string_literal: true

require 'html/pipeline'

class HelpMarkdownFilter < HTML::Pipeline::MarkdownFilter
  def call
    html = super

    format_callout!(html)
  end

  def format_callout!(html)
    html.gsub!(%r{(?:<p>)?{{#(tip|warning|error)}}(?:</p>)?}, '<div class="alert \1">')
    html.gsub!(%r{(?:<p>)?{{/(tip|warning|error)}}(?:</p>)?}, '</div>')
  end
end
