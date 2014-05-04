module BillNyeRenamer
  class Episode
    TVDB_SERIES_ID = '78494'

    def self.all
      @all ||= series.episodes
    end

    private

    def self.client
      @client ||= Tvdbr::Client.new(BillNyeRenamer.tvdb_api_key)
    end

    def self.series
      @series ||= client.find_series_by_id(TVDB_SERIES_ID)
    end
  end
end
