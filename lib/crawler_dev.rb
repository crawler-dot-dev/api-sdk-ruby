# frozen_string_literal: true

# Standard libraries.
# rubocop:disable Lint/RedundantRequireStatement
require "English"
require "cgi"
require "date"
require "erb"
require "etc"
require "json"
require "net/http"
require "pathname"
require "rbconfig"
require "securerandom"
require "set"
require "stringio"
require "time"
require "uri"
# rubocop:enable Lint/RedundantRequireStatement

# We already ship the preferred sorbet manifests in the package itself.
# `tapioca` currently does not offer us a way to opt out of unnecessary compilation.
if Object.const_defined?(:Tapioca) &&
   caller.chain([$PROGRAM_NAME]).chain(ARGV).any?(/tapioca/) &&
   ARGV.none?(/dsl/)
  return
end

# Gems.
require "connection_pool"

# Package files.
require_relative "crawler_dev/version"
require_relative "crawler_dev/internal/util"
require_relative "crawler_dev/internal/type/converter"
require_relative "crawler_dev/internal/type/unknown"
require_relative "crawler_dev/internal/type/boolean"
require_relative "crawler_dev/internal/type/file_input"
require_relative "crawler_dev/internal/type/enum"
require_relative "crawler_dev/internal/type/union"
require_relative "crawler_dev/internal/type/array_of"
require_relative "crawler_dev/internal/type/hash_of"
require_relative "crawler_dev/internal/type/base_model"
require_relative "crawler_dev/internal/type/base_page"
require_relative "crawler_dev/internal/type/request_parameters"
require_relative "crawler_dev/internal"
require_relative "crawler_dev/request_options"
require_relative "crawler_dev/file_part"
require_relative "crawler_dev/errors"
require_relative "crawler_dev/internal/transport/base_client"
require_relative "crawler_dev/internal/transport/pooled_net_requester"
require_relative "crawler_dev/client"
require_relative "crawler_dev/models/file_extract_text_params"
require_relative "crawler_dev/models/file_extract_text_response"
require_relative "crawler_dev/models/url_extract_text_params"
require_relative "crawler_dev/models/url_extract_text_response"
require_relative "crawler_dev/models"
require_relative "crawler_dev/resources/files"
require_relative "crawler_dev/resources/urls"
