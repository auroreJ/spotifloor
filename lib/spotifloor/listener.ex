defmodule Spotifloor.Listener do
  defstruct first_name: "", last_name: "", track_list: [], premium_member: :false

  alias Spotifloor.Listener
  alias Spotifloor.MusicLibrary

  def get() do
    %Listener{first_name: "listener_first_name", last_name: "listener_last_name", track_list: []}
  end

  """
  def requests_tracks(listener, music_library, music_style) do
    with {:ok, tracks_list} <- MusicLibrary.get_tracks_by_music_style(music_library ,music_style) do
      listener = %Listener{listener | track_list: tracks_list}
    else
      {:error, :not_found} -> listener
    end
  end
"""
end
