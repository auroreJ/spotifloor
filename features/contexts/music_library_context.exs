defmodule Contexts.MusicLibraryContext do
  use WhiteBread.Context
  alias Spotifloor.MusicLibrary

  given_ ~r/^the music library is composed of classical, funk, rock tracks$/, fn state ->
    music_library = MusicLibrary.get_tracks()
    {:ok, state |> Map.put(:music_library, music_library)}
  end

  when_ ~r/^the listener requests tracks for the "(?<music_style>[^"]+)" music style$/,
        fn state, %{music_style: music_style} ->
          track_list =
            state.music_library |> MusicLibrary.get_tracks_by_music_style(String.to_atom(music_style))

          {:ok, state |> Map.put(:track_list, track_list)}
        end

  then_ ~r/^the listener gets the "(?<music_style>[^"]+)" tracks/, fn state, %{music_style: music_style} ->
    {:ok, track_list} = state.track_list
    assert List.first(track_list).music_style == String.to_atom(music_style)
    :ok
  end
end