defmodule Spotifloor.MusicLibraryTest do
  use ExUnit.Case
  alias Spotifloor.{Listener, MusicLibrary, MusicStyle, Track}

  @listener %Listener{
    first_name: "listener_first_name",
    last_name: "listener_last_name",
    premium: "false"
  }

  @music_library [
    %Track{music_style: MusicStyle.funk, title: "September", artist: "Earth Wind and Fire", preview: "false"},
    %Track{music_style: MusicStyle.rock, title: "Bohemian Rhapsody", artist: "Queen", preview: "false"},
    %Track{music_style: MusicStyle.classical, title: "9th Symphony", artist: "Beethoven", preview: "false"}
  ]

  test "get_tracks_by_music_style/3 fails when requested track is nil" do
    listener = @listener
    music_library = @music_library

    assert_raise ArgumentError, "the music style is nil", fn ->
      music_library
      |> MusicLibrary.get_tracks_by_music_style(nil, listener)
    end
  end

  test "get_tracks_by_music_style/3 fails when listener is nil" do
    music_library = @music_library

    assert_raise ArgumentError, "the listener is nil", fn ->
      music_library
      |> MusicLibrary.get_tracks_by_music_style(MusicStyle.funk, nil)
    end
  end

  test "get_tracks_by_music_style/3 return a not found error when the track list for requested music style is empty" do
    listener = @listener
    music_library = @music_library

    {:error, :not_found} = music_library |> MusicLibrary.get_tracks_by_music_style(:pop, listener)
  end
end
