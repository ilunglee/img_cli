module ImgCLI

  # EXIF
  class EXIF

    TABLE_HEADINGS = %w[path name ext size longitude latitude].freeze

    extend ImgCLI::Extensions::Callable

    attr_reader :dirs
    attr_accessor :files, :table

    def initialize(*args)
      @dirs  = args.flatten
      @files = []
    end

    def call
      extract_images
      sort_images
      output_results
      self
    end

    def count
      files.count
    end

    def headings
      TABLE_HEADINGS
    end

    private

    def output_results
      rows       = files.map(&:values)
      self.table = Terminal::Table.new rows: rows, headings: headings
    end

    def extract_images
      dirs.each do |dir|
        next unless File.directory?(dir)
        Dir["#{dir}/**/*.{jpg,jpeg}"].each do |file|
          next if File.directory? file
          files.push(format_file(file))
        end
      end
    end

    def sort_images
      files.sort_by! { |x| x[:path] }
    end

    def format_file(file)
      {
        name: File.basename(file),
        path: File.dirname(file),
        ext:  File.extname(file),
        size: File.size(file)
      }.merge(extract_exif(file))
    end

    def extract_exif(file)
      data = EXIFR::JPEG.new(file)
      {
        longitude: data.gps&.longitude,
        latitude:  data.gps&.latitude
      }
    end

  end

end
