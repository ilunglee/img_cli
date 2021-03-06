require 'spec_helper'

describe ImgCLI::Exports::HTML do
  let(:exif)    { ImgCLI::EXIF.call(File.expand_path('../support/test', __dir__)) }
  let(:subject) { ImgCLI::Exports::HTML.call(exif.files.map(&:values), headings: exif.headings) }
  let(:output)  { File.read(File.expand_path('../support/test/exports/results.html', __dir__)) }

  it_behaves_like 'export'
end
