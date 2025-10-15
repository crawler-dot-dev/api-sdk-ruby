# typed: strong

module CrawlerDev
  module Models
    class FileExtractTextParams < CrawlerDev::Internal::Type::BaseModel
      extend CrawlerDev::Internal::Type::RequestParameters::Converter
      include CrawlerDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            CrawlerDev::FileExtractTextParams,
            CrawlerDev::Internal::AnyHash
          )
        end

      # The file to upload.
      sig { returns(CrawlerDev::Internal::FileInput) }
      attr_accessor :file

      # Whether to clean the extracted text
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :clean_text

      sig { params(clean_text: T::Boolean).void }
      attr_writer :clean_text

      sig do
        params(
          file: CrawlerDev::Internal::FileInput,
          clean_text: T::Boolean,
          request_options: CrawlerDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The file to upload.
        file:,
        # Whether to clean the extracted text
        clean_text: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            file: CrawlerDev::Internal::FileInput,
            clean_text: T::Boolean,
            request_options: CrawlerDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
