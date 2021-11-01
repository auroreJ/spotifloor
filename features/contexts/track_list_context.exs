defmodule Contexts.TrackListContext do
  use WhiteBread.Context
  alias Spotifloor.MusicLibrary

  when_ ~r/^the listener requests tracks for the "(?<music_style>[^"]+)" music style$/,
        fn state, %{music_style: music_style} ->
          track_list =
            state.music_library
            |> MusicLibrary.get_tracks_by_music_style(String.to_atom(music_style), state.listener)

          {:ok, state |> Map.put(:track_list, track_list)}
        end

  then_ ~r/^the listener gets the "(?<music_style>[^"]+)" tracks/,
        fn state, %{music_style: music_style} ->
          {:ok, track_list} = state.track_list
          tracks_number_found = Enum.count(track_list, &(&1.music_style) ==  String.to_atom(music_style))
          assert length(track_list) == tracks_number_found

          :ok
        end

  then_ ~r/^the premium listener has access to "(?<music_style>[^"]+)" previews$/,
        fn state, %{music_style: music_style} ->
          {:ok, track_list} = state.track_list
          preview_tracks_found = Enum.count(track_list,
            fn track -> track.music_style == String.to_atom(music_style) and track.preview == "true" end)
          assert preview_tracks_found > 0

          :ok
        end

  then_ ~r/^there is no previews amongst the tracks$/,
        fn state ->
          {:ok, track_list} = state.track_list
          preview_tracks_found = Enum.count(track_list, &(&1.preview) ==  "true")
          assert preview_tracks_found == 0

          :ok
        end
end
