module ImgCLI

  module Extensions

    # Callable
    module Callable

      def call(*args, &block)
        new(*args).call(&block)
      end

    end

  end

end
