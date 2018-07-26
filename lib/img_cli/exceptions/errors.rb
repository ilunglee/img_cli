module ImgCLI

  module Exceptions

    # Base Error
    class BaseError < StandardError

      def initialize(msg:)
        super(msg)
      end

    end

    class InvalidFormatError < BaseError; end

  end

end
