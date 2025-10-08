# frozen_string_literal: true

require_relative "../test_helper"

class CrawlerDev::Test::Resources::FilesTest < CrawlerDev::Test::ResourceTest
  def test_extract_text_required_params
    skip("Prism tests are disabled")

    response = @crawler_dev.files.extract_text(file: Pathname(__FILE__))

    assert_pattern do
      response => CrawlerDev::Models::FileExtractTextResponse
    end

    assert_pattern do
      response => {
        content_type: String | nil,
        extracted_text: String | nil,
        filename: String | nil,
        size_bytes: Integer | nil,
        success: CrawlerDev::Internal::Type::Boolean | nil,
        text_length: Integer | nil
      }
    end
  end
end
