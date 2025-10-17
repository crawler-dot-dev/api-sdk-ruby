# typed: strong

module CrawlerDev
  module Models
    class URLExtractTextResponse < CrawlerDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            CrawlerDev::Models::URLExtractTextResponse,
            CrawlerDev::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :content_type

      sig { params(content_type: String).void }
      attr_writer :content_type

      sig { returns(T.nilable(String)) }
      attr_reader :extracted_text

      sig { params(extracted_text: String).void }
      attr_writer :extracted_text

      sig { returns(T.nilable(String)) }
      attr_reader :final_url

      sig { params(final_url: String).void }
      attr_writer :final_url

      sig { returns(T.nilable(Integer)) }
      attr_reader :size_bytes

      sig { params(size_bytes: Integer).void }
      attr_writer :size_bytes

      sig { returns(T.nilable(Integer)) }
      attr_reader :status_code

      sig { params(status_code: Integer).void }
      attr_writer :status_code

      sig { returns(T.nilable(Integer)) }
      attr_reader :text_length

      sig { params(text_length: Integer).void }
      attr_writer :text_length

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          content_type: String,
          extracted_text: String,
          final_url: String,
          size_bytes: Integer,
          status_code: Integer,
          text_length: Integer,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        content_type: nil,
        extracted_text: nil,
        final_url: nil,
        size_bytes: nil,
        status_code: nil,
        text_length: nil,
        url: nil
      )
      end

      sig do
        override.returns(
          {
            content_type: String,
            extracted_text: String,
            final_url: String,
            size_bytes: Integer,
            status_code: Integer,
            text_length: Integer,
            url: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
