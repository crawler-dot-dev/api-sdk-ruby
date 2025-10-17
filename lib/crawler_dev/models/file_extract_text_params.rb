# frozen_string_literal: true

module CrawlerDev
  module Models
    # @see CrawlerDev::Resources::Files#extract_text
    class FileExtractTextParams < CrawlerDev::Internal::Type::BaseModel
      extend CrawlerDev::Internal::Type::RequestParameters::Converter
      include CrawlerDev::Internal::Type::RequestParameters

      # @!attribute file
      #   The file to upload.
      #
      #   @return [Pathname, StringIO, IO, String, CrawlerDev::FilePart]
      required :file, CrawlerDev::Internal::Type::FileInput

      # @!attribute clean_text
      #   Whether to clean the extracted text
      #
      #   @return [Boolean, nil]
      optional :clean_text, CrawlerDev::Internal::Type::Boolean

      # @!method initialize(file:, clean_text: nil, request_options: {})
      #   @param file [Pathname, StringIO, IO, String, CrawlerDev::FilePart] The file to upload.
      #
      #   @param clean_text [Boolean] Whether to clean the extracted text
      #
      #   @param request_options [CrawlerDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
