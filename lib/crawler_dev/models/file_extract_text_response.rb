# frozen_string_literal: true

module CrawlerDev
  module Models
    # @see CrawlerDev::Resources::Files#extract_text
    class FileExtractTextResponse < CrawlerDev::Internal::Type::BaseModel
      # @!attribute content_type
      #
      #   @return [String, nil]
      optional :content_type, String, api_name: :contentType

      # @!attribute extracted_text
      #
      #   @return [String, nil]
      optional :extracted_text, String, api_name: :extractedText

      # @!attribute filename
      #
      #   @return [String, nil]
      optional :filename, String

      # @!attribute size_bytes
      #
      #   @return [Integer, nil]
      optional :size_bytes, Integer, api_name: :sizeBytes

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, CrawlerDev::Internal::Type::Boolean

      # @!attribute text_length
      #
      #   @return [Integer, nil]
      optional :text_length, Integer, api_name: :textLength

      # @!method initialize(content_type: nil, extracted_text: nil, filename: nil, size_bytes: nil, success: nil, text_length: nil)
      #   @param content_type [String]
      #   @param extracted_text [String]
      #   @param filename [String]
      #   @param size_bytes [Integer]
      #   @param success [Boolean]
      #   @param text_length [Integer]
    end
  end
end
