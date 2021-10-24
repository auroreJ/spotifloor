defmodule Contexts.MusicLibraryContext do
  use WhiteBread.Context
  alias Spotifloor.MusicLibrary

  given_ ~r/^the music library is composed of classical, funk, rock tracks$/, fn state ->
    music_library = MusicLibrary.get_tracks()
    {:ok, state |> Map.put(:music_library, music_library)}
  end
end