# frozen_string_literal: true

module Jekyll
  module Converters
    class Markdown::HTMLPipeline
      def initialize(config)
        require 'html/pipeline'
        @config = config
        @errors = []
        @setup = false
      end

      def filter_key(key)
        key.to_s.downcase.to_sym
      end

      def filter?(filter)
        filter < HTML::Pipeline::Filter
      rescue LoadError, ArgumentError
        false
      end

      def symbolize_keys(hash)
        hash.each_with_object({}) do |(key, value), result|
          new_key = case key
                    when String then key.to_sym
                    else key
                    end
          new_value = case value
                      when Hash then symbolize_keys(value)
                      when Array then value.map(&:to_sym)
                      else value
                      end
          result[new_key] = new_value
        end
      end

      def ensure_default_opts
        @config['html_pipeline']['filters'] ||= ['markdownfilter']
        @config['html_pipeline']['context'] ||= { 'gfm' => true }
        # symbolize strings as keys, which is what HTML::Pipeline wants
        @config['html_pipeline']['context'] = symbolize_keys(@config['html_pipeline']['context'])
      end

      def setup
        return if @setup

        ensure_default_opts

        filters = @config['html_pipeline']['filters'].map do |filter|
          if filter?(filter)
            filter
          else
            key = filter_key(filter)
            begin
              const_filter = HTML::Pipeline.constants.find { |c| c.downcase == key }
              # probably a custom filter
              if const_filter.nil?
                Jekyll::Converters.const_get(filter)
              else
                HTML::Pipeline.const_get(const_filter)
              end
            rescue StandardError => e
              raise LoadError, e
            end
          end
        end

        @parser = HTML::Pipeline.new(filters, @config['html_pipeline']['context'])
        @setup = true
      end

      def convert(content)
        setup
        @parser.to_html(content)
      end
    end
  end
end
