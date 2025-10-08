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
          render_js: T::Boolean,
          strip_boilerplate: T::Boolean,
          request_options: CrawlerDev::RequestOptions::OrHash
        ).returns(CrawlerDev::Models::URLExtractTextResponse)
      end
      def extract_text(
        # The URL to extract text from.
        url:,
        # Whether to clean extracted text
        clean_text: nil,
        # Whether to render JavaScript for HTML content. This parameter is ignored for
        # binary content types (PDF, DOC, etc.) since they are not HTML.
        render_js: nil,
        # Whether to remove boilerplate text
        strip_boilerplate: nil,
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
