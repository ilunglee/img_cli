module ImgCLI

  module Exports

    # HTML Export
    class HTML

      extend ImgCLI::Extensions::Callable

      attr_accessor :headings, :rows, :result

      def initialize(rows, headings: [])
        @headings = headings
        @rows     = rows
      end

      def call
        template    = File.read(File.expand_path('templates/export.erb', __dir__))
        self.result = ERB.new(template, nil, '-').result(binding)
        self
      end

    end

  end

end
