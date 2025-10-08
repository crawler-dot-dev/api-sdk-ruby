# frozen_string_literal: true

module CrawlerDev
  module Models
    # @see CrawlerDev::Resources::URLs#extract_text
    class URLExtractTextParams < CrawlerDev::Internal::Type::BaseModel
      extend CrawlerDev::Internal::Type::RequestParameters::Converter
      include CrawlerDev::Internal::Type::RequestParameters

      # @!attribute url
      #   The URL to extract text from.
      #
      #   @return [String]
      required :url, String

      # @!attribute clean_text
      #   Whether to clean extracted text
      #
      #   @return [Boolean, nil]
      optional :clean_text, CrawlerDev::Internal::Type::Boolean

      # @!attribute render_js
      #   Whether to render JavaScript for HTML content. This parameter is ignored for
      #   binary content types (PDF, DOC, etc.) since they are not HTML.
      #
      #   @return [Boolean, nil]
      optional :render_js, CrawlerDev::Internal::Type::Boolean

      # @!attribute strip_boilerplate
      #   Whether to remove boilerplate text
      #
      #   @return [Boolean, nil]
      optional :strip_boilerplate, CrawlerDev::Internal::Type::Boolean

      # @!method initialize(url:, clean_text: nil, render_js: nil, strip_boilerplate: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {CrawlerDev::Models::URLExtractTextParams} for more details.
      #
      #   @param url [String] The URL to extract text from.
      #
      #   @param clean_text [Boolean] Whether to clean extracted text
      #
      #   @param render_js [Boolean] Whether to render JavaScript for HTML content. This parameter is ignored for bin
      #
      #   @param strip_boilerplate [Boolean] Whether to remove boilerplate text
      #
      #   @param request_options [CrawlerDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
