defmodule Contexts.MusicLibraryContext do
  use WhiteBread.Context
  alias Spotifloor.{MusicStyle, Track}

  given_ ~r/^the music library is composed of classical, funk, rock tracks$/, fn state ->
      #given_music_library
  end

  given_ ~r/^the music library has previews for the classical style$/, fn state ->
      #given_library_previews
  end
end