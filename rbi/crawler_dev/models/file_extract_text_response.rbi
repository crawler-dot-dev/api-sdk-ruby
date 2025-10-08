# typed: strong

module CrawlerDev
  module Models
    class FileExtractTextResponse < CrawlerDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            CrawlerDev::Models::FileExtractTextResponse,
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
      attr_reader :filename

      sig { params(filename: String).void }
      attr_writer :filename

      sig { returns(T.nilable(Integer)) }
      attr_reader :size_bytes

      sig { params(size_bytes: Integer).void }
      attr_writer :size_bytes

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig { returns(T.nilable(Integer)) }
      attr_reader :text_length

      sig { params(text_length: Integer).void }
      attr_writer :text_length

      sig do
        params(
          content_type: String,
          extracted_text: String,
          filename: String,
          size_bytes: Integer,
          success: T::Boolean,
          text_length: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        content_type: nil,
        extracted_text: nil,
        filename: nil,
        size_bytes: nil,
        success: nil,
        text_length: nil
      )
      end

      sig do
        override.returns(
          {
            content_type: String,
            extracted_text: String,
            filename: String,
            size_bytes: Integer,
            success: T::Boolean,
            text_length: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
