defmodule Spotifloor.ListenerTest do
  use ExUnit.Case
  alias Spotifloor.{Listener, MusicLibrary, MusicStyle}

  @expected_listener %{
    first_name: "listener_first_name",
    last_name: "listener_last_name"
  }


  test "get/1 retrieve a user 💪" do
    %Listener{first_name: first_name,  last_name: last_name, track_list: track_list} = Listener.get()
    assert first_name == @expected_listener.first_name
    assert last_name == @expected_listener.last_name
    assert track_list == []
  end

  """
  test "requests_tracks/2 add the track to the user's track list" do
    music_library = MusicLibrary.get_tracks()
    listener = Listener.get()

    listener = listener |> Listener.requests_tracks(music_library, MusicStyle.funk)
    assert length(listener.track_list) == 1
    funk_music = List.first(listener.track_list)
    assert funk_music.music_style == :funk
  end
"""
end
