module ImgCLI

  module Exports

    # CSV Export
    class CSV

      extend ImgCLI::Extensions::Callable

      attr_accessor :headings, :rows, :result

      def initialize(rows, headings: [])
        @headings = headings
        @rows     = rows
      end

      def call
        self.result =
          ::CSV.generate(headers: true, col_sep: ',', row_sep: "\n") do |csv|
            csv << headings if headings.any?
            rows.each { |row| csv << row }
          end
        self
      end

    end

  end

end
