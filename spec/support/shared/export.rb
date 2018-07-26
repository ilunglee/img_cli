require 'spec_helper'

shared_examples 'export' do
  it 'returns heading' do
    expect(subject.headings).to match_array(exif.headings)
  end

  it 'returns rows' do
    expect(subject.rows.map(&:first)).to match_array(exif.files.map { |x| x[:name] })
  end

  it 'returns result' do
    expect(subject.result.class).to eq(String)
  end
end
