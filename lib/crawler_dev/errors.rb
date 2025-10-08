# frozen_string_literal: true

module CrawlerDev
  module Errors
    class Error < StandardError
      # @!attribute cause
      #
      #   @return [StandardError, nil]
    end

    class ConversionError < CrawlerDev::Errors::Error
      # @return [StandardError, nil]
      def cause = @cause.nil? ? super : @cause

      # @api private
      #
      # @param on [Class<StandardError>]
      # @param method [Symbol]
      # @param target [Object]
      # @param value [Object]
      # @param cause [StandardError, nil]
      def initialize(on:, method:, target:, value:, cause: nil)
        cls = on.name.split("::").last

        message = [
          "Failed to parse #{cls}.#{method} from #{value.class} to #{target.inspect}.",
          "To get the unparsed API response, use #{cls}[#{method.inspect}].",
          cause && "Cause: #{cause.message}"
        ].filter(&:itself).join(" ")

        @cause = cause
        super(message)
      end
    end

    class APIError < CrawlerDev::Errors::Error
      # @return [URI::Generic]
      attr_accessor :url

      # @return [Integer, nil]
      attr_accessor :status

      # @return [Hash{String=>String}, nil]
      attr_accessor :headers

      # @return [Object, nil]
      attr_accessor :body

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer, nil]
      # @param headers [Hash{String=>String}, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status: nil, headers: nil, body: nil, request: nil, response: nil, message: nil)
        @url = url
        @status = status
        @headers = headers
        @body = body
        @request = request
        @response = response
        super(message)
      end
    end

    class APIConnectionError < CrawlerDev::Errors::APIError
      # @!attribute status
      #
      #   @return [nil]

      # @!attribute body
      #
      #   @return [nil]

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param headers [Hash{String=>String}, nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        headers: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Connection error."
      )
        super
      end
    end

    class APITimeoutError < CrawlerDev::Errors::APIConnectionError
      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param headers [Hash{String=>String}, nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        headers: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Request timed out."
      )
        super
      end
    end

    class APIStatusError < CrawlerDev::Errors::APIError
      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer]
      # @param headers [Hash{String=>String}, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      #
      # @return [self]
      def self.for(url:, status:, headers:, body:, request:, response:, message: nil)
        kwargs =
          {
            url: url,
            status: status,
            headers: headers,
            body: body,
            request: request,
            response: response,
            message: message
          }

        case status
        in 400
          CrawlerDev::Errors::BadRequestError.new(**kwargs)
        in 401
          CrawlerDev::Errors::AuthenticationError.new(**kwargs)
        in 403
          CrawlerDev::Errors::PermissionDeniedError.new(**kwargs)
        in 404
          CrawlerDev::Errors::NotFoundError.new(**kwargs)
        in 409
          CrawlerDev::Errors::ConflictError.new(**kwargs)
        in 422
          CrawlerDev::Errors::UnprocessableEntityError.new(**kwargs)
        in 429
          CrawlerDev::Errors::RateLimitError.new(**kwargs)
        in (500..)
          CrawlerDev::Errors::InternalServerError.new(**kwargs)
        else
          CrawlerDev::Errors::APIStatusError.new(**kwargs)
        end
      end

      # @!parse
      #   # @return [Integer]
      #   attr_accessor :status

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer]
      # @param headers [Hash{String=>String}, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status:, headers:, body:, request:, response:, message: nil)
        message ||= {url: url.to_s, status: status, body: body}
        super(
          url: url,
          status: status,
          headers: headers,
          body: body,
          request: request,
          response: response,
          message: message&.to_s
        )
      end
    end

    class BadRequestError < CrawlerDev::Errors::APIStatusError
      HTTP_STATUS = 400
    end

    class AuthenticationError < CrawlerDev::Errors::APIStatusError
      HTTP_STATUS = 401
    end

    class PermissionDeniedError < CrawlerDev::Errors::APIStatusError
      HTTP_STATUS = 403
    end

    class NotFoundError < CrawlerDev::Errors::APIStatusError
      HTTP_STATUS = 404
    end

    class ConflictError < CrawlerDev::Errors::APIStatusError
      HTTP_STATUS = 409
    end

    class UnprocessableEntityError < CrawlerDev::Errors::APIStatusError
      HTTP_STATUS = 422
    end

    class RateLimitError < CrawlerDev::Errors::APIStatusError
      HTTP_STATUS = 429
    end

    class InternalServerError < CrawlerDev::Errors::APIStatusError
      HTTP_STATUS = (500..)
    end
  end
end
