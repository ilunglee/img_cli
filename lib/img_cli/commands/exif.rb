module ImgCLI

  module Commands

    # EXIF
    class EXIF

      extend ImgCLI::Extensions::Callable

      attr_reader :dirs, :extension, :filename, :pastel, :spinner

      def initialize(dirs, extension: 'csv', filename: 'results')
        @dirs      = dirs
        @extension = extension
        @filename  = filename
        @pastel    = Pastel.new
        @spinner   = TTY::Spinner.new("[#{pastel.blue(':spinner')}] :title", format: :dots)
      end

      def call
        load_files
        export_files
      end

      private

      def exif
        @exif ||= ImgCLI::EXIF.call(dirs)
      end

      def export
        @export ||= determine_format
      end

      def determine_format
        case extension
        when 'csv'
          ImgCLI::Exports::CSV.call(exif.files.map(&:values), headings: exif.headings)
        when 'html'
          ImgCLI::Exports::HTML.call(exif.files.map(&:values), headings: exif.headings)
        else
          invalid_format
        end
      end

      def load_files
        loading('Loading files...', "#{exif.count} file(s) loaded")
        puts exif.table
      end

      def export_files
        name = "#{filename}.#{extension}"
        loading("exporting file as #{extension}", "exported to #{name}") do
          File.open(name, 'w+') { |f| f.write export.result }
        end
      end

      # rubocop:disable Metrics/AbcSize
      def loading(start, success)
        spinner.reset
        spinner.update(title: start)
        spinner.auto_spin
        sleep(2)
        yield if block_given?
        spinner.update(title: success)
        spinner.success
      rescue StandardError => e
        spinner.error('(error)')
        puts "#{e.class} - #{e.message}"
      end
      # rubocop:enable Metrics/AbcSize

      def invalid_format
        raise(ImgCLI::Exceptions::InvalidFormatError.
              new(msg: 'Invalid format. Valid options are csv, html'))
      end

    end

  end

end
