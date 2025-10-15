# typed: strong

module CrawlerDev
  module Resources
    class URLs
      # Extract text content from a webpage or document accessible via URL. Supports
      # HTML, PDF, and other web-accessible content types.
      sig do
        params(
          url: String,
          clean_text: T::Boolean,
          headers: T::Hash[Symbol, String],
          proxy: CrawlerDev::URLExtractTextParams::Proxy::OrHash,
          request_options: CrawlerDev::RequestOptions::OrHash
        ).returns(CrawlerDev::Models::URLExtractTextResponse)
      end
      def extract_text(
        # The URL to extract text from.
        url:,
        # Whether to clean extracted text
        clean_text: nil,
        # Custom HTTP headers to send with the request (case-insensitive)
        headers: nil,
        # Proxy configuration for the request
        proxy: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: CrawlerDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
