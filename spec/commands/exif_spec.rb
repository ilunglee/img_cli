require 'spec_helper'

describe ImgCLI::EXIF do
  let(:subject) do
    ImgCLI::Commands::EXIF.new(File.expand_path('support/test', __dir__),
                               extension: 'csv', filename: 'test')
  end

  it 'returns dirs' do
    expect(subject.dirs).to_not eq(nil)
  end

  it 'returns extension' do
    expect(subject.extension).to_not eq(nil)
  end

  it 'returns filename' do
    expect(subject.filename).to_not eq(nil)
  end
end
