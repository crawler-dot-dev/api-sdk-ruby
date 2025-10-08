# frozen_string_literal: true

module CrawlerDev
  module Models
    # @see CrawlerDev::Resources::URLs#extract_text
    class URLExtractTextResponse < CrawlerDev::Internal::Type::BaseModel
      # @!attribute content_type
      #
      #   @return [String, nil]
      optional :content_type, String, api_name: :contentType

      # @!attribute extracted_text
      #
      #   @return [String, nil]
      optional :extracted_text, String, api_name: :extractedText

      # @!attribute final_url
      #
      #   @return [String, nil]
      optional :final_url, String, api_name: :finalUrl

      # @!attribute size_bytes
      #
      #   @return [Integer, nil]
      optional :size_bytes, Integer, api_name: :sizeBytes

      # @!attribute status_code
      #
      #   @return [Integer, nil]
      optional :status_code, Integer, api_name: :statusCode

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, CrawlerDev::Internal::Type::Boolean

      # @!attribute text_length
      #
      #   @return [Integer, nil]
      optional :text_length, Integer, api_name: :textLength

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(content_type: nil, extracted_text: nil, final_url: nil, size_bytes: nil, status_code: nil, success: nil, text_length: nil, url: nil)
      #   @param content_type [String]
      #   @param extracted_text [String]
      #   @param final_url [String]
      #   @param size_bytes [Integer]
      #   @param status_code [Integer]
      #   @param success [Boolean]
      #   @param text_length [Integer]
      #   @param url [String]
    end
  end
end
