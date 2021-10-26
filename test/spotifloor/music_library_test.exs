defmodule Spotifloor.MusicLibraryTest do
  use ExUnit.Case
  alias Spotifloor.{MusicLibrary, MusicStyle}

  test "get_tracks/0 💪 🎸 🎻 🎷" do
    [funk_track | [rock_track | [classical_track]]] = MusicLibrary.get_tracks()
    assert funk_track.music_style == MusicStyle.funk()
    assert classical_track.music_style == MusicStyle.classical()
    assert rock_track.music_style == MusicStyle.rock()
  end

  test "get_tracks_by_music_style/2 return only tracks for requested music style" do
    music_library = MusicLibrary.get_tracks()

    {:ok, requested_music_style_tracks} =
      music_library |> MusicLibrary.get_tracks_by_music_style(MusicStyle.classical())

    assert length(requested_music_style_tracks) == 1
    assert List.first(requested_music_style_tracks).music_style == MusicStyle.classical()
  end
end
