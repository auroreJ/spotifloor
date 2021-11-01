defmodule Spotifloor.MusicLibrary do
  alias Spotifloor.{Listener, Track}

  def get_tracks_by_music_style(_music_library, _requested_music_style, listener, track_list \\ [])

  def get_tracks_by_music_style(_music_library, nil, _listener, _track_list) do
    raise ArgumentError, message: "the music style is nil"
  end

  def get_tracks_by_music_style(_music_library, _requested_music_style, nil, _track_list) do
    raise ArgumentError, message: "the listener is nil"
  end

  def get_tracks_by_music_style([], _requested_music_style, _listener, track_list) do
    if track_list == [] do
      {:error, :not_found}
    else
      {:ok, track_list}
    end
  end

  def get_tracks_by_music_style(
        [%Track{music_style: music_style} = track | tail],
        requested_music_style,
        listener,
        track_list
      )
      when music_style == requested_music_style do
    track_list = track_list |> add_preview_track?(track, listener)
    get_tracks_by_music_style(tail, requested_music_style, listener, track_list)
  end

  def get_tracks_by_music_style(
        [_head | tail] = _music_library,
        requested_music_style,
        listener,
        track_list
      ) do
    get_tracks_by_music_style(tail, requested_music_style, listener, track_list)
  end

  defp add_preview_track?(track_list, %Track{preview: "true"}, %Listener{premium: "false"}) do
    track_list
  end

  defp add_preview_track?(track_list, track, _listener), do: track_list ++ [track]
end
