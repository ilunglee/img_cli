require 'spec_helper'

describe ImgCLI::Exports::CSV do
  let(:exif)    { ImgCLI::EXIF.call(File.expand_path('../support/test', __dir__)) }
  let(:subject) { ImgCLI::Exports::CSV.call(exif.files.map(&:values), headings: exif.headings) }
  let(:output)  { File.read(File.expand_path('../support/test/exports/results.csv', __dir__)) }

  it_behaves_like 'export'
end
