require 'spec_helper'

describe ImgCLI::EXIF do
  let(:subject) { ImgCLI::EXIF.call(File.expand_path('support/test', __dir__)) }

  it 'returns file count' do
    expect(subject.count).to eq(5)
  end

  it 'returns heading' do
    expect(subject.headings).to match_array(ImgCLI::EXIF::TABLE_HEADINGS)
  end

  it 'stores files' do
    expect(subject.files.any?).to eq(true)
  end

  it 'stores table' do
    expect(subject.table.rows.count).to eq(subject.count)
  end

  it 'sorts images by path' do
    expect(subject.files.map { |x| x[:name] }).to match_array(%w[image_a.jpg image_b.jpg image_c.jpg image_d.jpg image_e.jpg])
  end

  it 'has the same keys as headings' do
    keys = subject.files.map(&:keys).first.map(&:to_s)
    expect(keys).to match_array(ImgCLI::EXIF::TABLE_HEADINGS)
  end
end
