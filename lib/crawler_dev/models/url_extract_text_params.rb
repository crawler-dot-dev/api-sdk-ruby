# frozen_string_literal: true

module CrawlerDev
  module Models
    # @see CrawlerDev::Resources::URLs#extract_text
    class URLExtractTextParams < CrawlerDev::Internal::Type::BaseModel
      extend CrawlerDev::Internal::Type::RequestParameters::Converter
      include CrawlerDev::Internal::Type::RequestParameters

      # @!attribute url
      #   The URL to extract text from.
      #
      #   @return [String]
      required :url, String

      # @!attribute clean_text
      #   Whether to clean extracted text
      #
      #   @return [Boolean, nil]
      optional :clean_text, CrawlerDev::Internal::Type::Boolean

      # @!attribute headers
      #   Custom HTTP headers to send with the request (case-insensitive)
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, CrawlerDev::Internal::Type::HashOf[String]

      # @!attribute proxy
      #   Proxy configuration for the request
      #
      #   @return [CrawlerDev::Models::URLExtractTextParams::Proxy, nil]
      optional :proxy, -> { CrawlerDev::URLExtractTextParams::Proxy }

      # @!method initialize(url:, clean_text: nil, headers: nil, proxy: nil, request_options: {})
      #   @param url [String] The URL to extract text from.
      #
      #   @param clean_text [Boolean] Whether to clean extracted text
      #
      #   @param headers [Hash{Symbol=>String}] Custom HTTP headers to send with the request (case-insensitive)
      #
      #   @param proxy [CrawlerDev::Models::URLExtractTextParams::Proxy] Proxy configuration for the request
      #
      #   @param request_options [CrawlerDev::RequestOptions, Hash{Symbol=>Object}]

      class Proxy < CrawlerDev::Internal::Type::BaseModel
        # @!attribute password
        #   Proxy password for authentication
        #
        #   @return [String, nil]
        optional :password, String

        # @!attribute server
        #   Proxy server URL (e.g., http://proxy.example.com:8080 or
        #   socks5://proxy.example.com:1080)
        #
        #   @return [String, nil]
        optional :server, String

        # @!attribute username
        #   Proxy username for authentication
        #
        #   @return [String, nil]
        optional :username, String

        # @!method initialize(password: nil, server: nil, username: nil)
        #   Some parameter documentations has been truncated, see
        #   {CrawlerDev::Models::URLExtractTextParams::Proxy} for more details.
        #
        #   Proxy configuration for the request
        #
        #   @param password [String] Proxy password for authentication
        #
        #   @param server [String] Proxy server URL (e.g., http://proxy.example.com:8080 or socks5://proxy.example.
        #
        #   @param username [String] Proxy username for authentication
      end
    end
  end
end
