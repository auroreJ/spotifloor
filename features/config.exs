defmodule WhiteBreadConfig do
  use WhiteBread.SuiteConfiguration

  suite name:          "",
        context:       Contexts.SearchForMusicTracksContext,
        feature_paths: ["features/search_for_music_tracks.feature"]
end
