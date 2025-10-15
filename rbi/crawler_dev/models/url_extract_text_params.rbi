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

      # Custom HTTP headers to send with the request (case-insensitive)
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Proxy configuration for the request
      sig { returns(T.nilable(CrawlerDev::URLExtractTextParams::Proxy)) }
      attr_reader :proxy

      sig do
        params(proxy: CrawlerDev::URLExtractTextParams::Proxy::OrHash).void
      end
      attr_writer :proxy

      sig do
        params(
          url: String,
          clean_text: T::Boolean,
          headers: T::Hash[Symbol, String],
          proxy: CrawlerDev::URLExtractTextParams::Proxy::OrHash,
          request_options: CrawlerDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The URL to extract text from.
        url:,
        # Whether to clean extracted text
        clean_text: nil,
        # Custom HTTP headers to send with the request (case-insensitive)
        headers: nil,
        # Proxy configuration for the request
        proxy: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            url: String,
            clean_text: T::Boolean,
            headers: T::Hash[Symbol, String],
            proxy: CrawlerDev::URLExtractTextParams::Proxy,
            request_options: CrawlerDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Proxy < CrawlerDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              CrawlerDev::URLExtractTextParams::Proxy,
              CrawlerDev::Internal::AnyHash
            )
          end

        # Proxy password for authentication
        sig { returns(T.nilable(String)) }
        attr_reader :password

        sig { params(password: String).void }
        attr_writer :password

        # Proxy server URL (e.g., http://proxy.example.com:8080 or
        # socks5://proxy.example.com:1080)
        sig { returns(T.nilable(String)) }
        attr_reader :server

        sig { params(server: String).void }
        attr_writer :server

        # Proxy username for authentication
        sig { returns(T.nilable(String)) }
        attr_reader :username

        sig { params(username: String).void }
        attr_writer :username

        # Proxy configuration for the request
        sig do
          params(password: String, server: String, username: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Proxy password for authentication
          password: nil,
          # Proxy server URL (e.g., http://proxy.example.com:8080 or
          # socks5://proxy.example.com:1080)
          server: nil,
          # Proxy username for authentication
          username: nil
        )
        end

        sig do
          override.returns(
            { password: String, server: String, username: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
