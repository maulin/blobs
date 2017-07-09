require_relative '../lib/blobs/blob'
require_relative '../lib/blobs/dna'
require_relative '../lib/blobs/gene'

describe Blob do
  describe 'TYPES' do
    it 'has the right values' do
      expect(Blob::TYPES).to eq(['blue', 'pink'])
    end
  end

  describe 'initialization' do
    let(:types) { double('types') }

    before do
      allow(types).to receive_messages(:sample => 'foo')
      stub_const('Blob::TYPES', types)
    end

    it 'randomly sets the type from TYPES when a type is not passed in' do
      blob = Blob.new

      expect(blob.type).to eq('foo')
    end

    it 'sets the type to the passed in type' do
      blob = Blob.new('blue')

      expect(blob.type).to eq('blue')
      expect(types).not_to receive(:sample)
    end
  end

  describe 'genome' do
    let(:dna) { double('dna', :to_s => 'agct') }

    it 'returns a hash with the type and dna string of the blob' do
      subject.dna = dna
      subject.type = 'foo'

      expect(subject.genome).to eq({
        :type => 'foo',
        :dna => 'agct'
      })
    end
  end
end
