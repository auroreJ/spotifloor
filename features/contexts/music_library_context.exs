defmodule Contexts.MusicLibraryContext do
  use WhiteBread.Context
  alias Spotifloor.{MusicStyle, Track}

  given_ ~r/^the music library is composed of classical, funk, rock tracks$/, fn state ->
      music_library =
        [
          %Track{music_style: MusicStyle.funk, title: "September", artist: "Earth Wind and Fire", preview: "false"},
          %Track{music_style: MusicStyle.rock, title: "Bohemian Rhapsody", artist: "Queen", preview: "false"},
          %Track{music_style: MusicStyle.classical, title: "9th Symphony", artist: "Beethoven", preview: "false"}
        ]

      {:ok, state |> Map.put(:music_library, music_library)}
  end

  given_ ~r/^the music library has previews for the classical style$/, fn state ->
      music_library =
        [
          %Track{music_style: MusicStyle.funk, title: "September", artist: "Earth Wind and Fire", preview: "false"},
          %Track{music_style: MusicStyle.rock, title: "Bohemian Rhapsody", artist: "Queen", preview: "false"},
          %Track{music_style: MusicStyle.classical, title: "9th Symphony", artist: "Beethoven", preview: "false"},
          %Track{music_style: MusicStyle.classical, title: "20th Symphony", artist: "Beethoven", preview: "true"}
        ]

      {:ok, state |> Map.put(:music_library, music_library)}
  end
end