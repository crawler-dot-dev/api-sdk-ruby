# typed: strong

module CrawlerDev
  module Resources
    class Files
      # Upload a file and extract text content from it. Supports PDF, DOC, DOCX, TXT and
      # other text-extractable document formats.
      sig do
        params(
          file: CrawlerDev::Internal::FileInput,
          clean_text: T::Boolean,
          strip_boilerplate: T::Boolean,
          request_options: CrawlerDev::RequestOptions::OrHash
        ).returns(CrawlerDev::Models::FileExtractTextResponse)
      end
      def extract_text(
        # The file to upload.
        file:,
        # Whether to clean the extracted text
        clean_text: nil,
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
