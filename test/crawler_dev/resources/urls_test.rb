# frozen_string_literal: true

require_relative "../test_helper"

class CrawlerDev::Test::Resources::URLsTest < CrawlerDev::Test::ResourceTest
  def test_extract_text_required_params
    skip("Prism tests are disabled")

    response = @crawler_dev.urls.extract_text(url: "url")

    assert_pattern do
      response => CrawlerDev::Models::URLExtractTextResponse
    end

    assert_pattern do
      response => {
        content_type: String | nil,
        extracted_text: String | nil,
        final_url: String | nil,
        size_bytes: Integer | nil,
        status_code: Integer | nil,
        success: CrawlerDev::Internal::Type::Boolean | nil,
        text_length: Integer | nil,
        url: String | nil
      }
    end
  end
end
