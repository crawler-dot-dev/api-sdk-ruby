# frozen_string_literal: true

module CrawlerDev
  module Resources
    class Files
      # Upload a file and extract text content from it. Supports PDF, DOC, DOCX, TXT and
      # other text-extractable document formats.
      #
      # @overload extract_text(file:, clean_text: nil, request_options: {})
      #
      # @param file [Pathname, StringIO, IO, String, CrawlerDev::FilePart] The file to upload.
      #
      # @param clean_text [Boolean] Whether to clean the extracted text
      #
      # @param request_options [CrawlerDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [CrawlerDev::Models::FileExtractTextResponse]
      #
      # @see CrawlerDev::Models::FileExtractTextParams
      def extract_text(params)
        parsed, options = CrawlerDev::FileExtractTextParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/files/text",
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: CrawlerDev::Models::FileExtractTextResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [CrawlerDev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
