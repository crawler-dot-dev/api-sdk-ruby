# typed: strong

module CrawlerDev
  module Models
    class URLExtractTextParams < CrawlerDev::Internal::Type::BaseModel
      extend CrawlerDev::Internal::Type::RequestParameters::Converter
      include CrawlerDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(CrawlerDev::URLExtractTextParams, CrawlerDev::Internal::AnyHash)
        end

      # The URL to extract text from.
      sig { returns(String) }
      attr_accessor :url

      # Whether to clean extracted text
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :clean_text

      sig { params(clean_text: T::Boolean).void }
      attr_writer :clean_text

      # Whether to render JavaScript for HTML content. This parameter is ignored for
      # binary content types (PDF, DOC, etc.) since they are not HTML.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :render_js

      sig { params(render_js: T::Boolean).void }
      attr_writer :render_js

      # Whether to remove boilerplate text
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :strip_boilerplate

      sig { params(strip_boilerplate: T::Boolean).void }
      attr_writer :strip_boilerplate

      sig do
        params(
          url: String,
          clean_text: T::Boolean,
          render_js: T::Boolean,
          strip_boilerplate: T::Boolean,
          request_options: CrawlerDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            url: String,
            clean_text: T::Boolean,
            render_js: T::Boolean,
            strip_boilerplate: T::Boolean,
            request_options: CrawlerDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
