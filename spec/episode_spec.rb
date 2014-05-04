require 'spec_helper'

describe BillNyeRenamer::Episode do
  around(:each) do |example|
    VCR.use_cassette('episode') do
      example.run
    end
  end

  context 'self.all' do
    it 'returns an array of all episodes' do
      episodes = BillNyeRenamer::Episode.all

      expect(episodes).to have_at_least(1).item
      expect(episodes.first).to be_instance_of(Tvdbr::Episode)
    end
  end
end
