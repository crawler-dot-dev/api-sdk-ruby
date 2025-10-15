# frozen_string_literal: true

module CrawlerDev
  module Resources
    class URLs
      # Extract text content from a webpage or document accessible via URL. Supports
      # HTML, PDF, and other web-accessible content types.
      #
      # @overload extract_text(url:, clean_text: nil, headers: nil, proxy: nil, request_options: {})
      #
      # @param url [String] The URL to extract text from.
      #
      # @param clean_text [Boolean] Whether to clean extracted text
      #
      # @param headers [Hash{Symbol=>String}] Custom HTTP headers to send with the request (case-insensitive)
      #
      # @param proxy [CrawlerDev::Models::URLExtractTextParams::Proxy] Proxy configuration for the request
      #
      # @param request_options [CrawlerDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CrawlerDev::Models::URLExtractTextResponse]
      #
      # @see CrawlerDev::Models::URLExtractTextParams
      def extract_text(params)
        parsed, options = CrawlerDev::URLExtractTextParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/urls/text",
          body: parsed,
          model: CrawlerDev::Models::URLExtractTextResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [CrawlerDev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
