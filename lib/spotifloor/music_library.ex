defmodule Spotifloor.MusicLibrary do
  alias Spotifloor.Track

  def get_tracks() do
    funk_track = %Track{music_style: :funk, title: "September", artist: "Earth Wind and Fire"}
    rock_track = %Track{music_style: :rock, title: "Bohemian Rhapsody", artist: "Queen"}
    classical_track = %Track{music_style: :classical, title: "9th Symphony", artist: "Beethoven"}
    [funk_track, rock_track, classical_track]
  end

  def get_tracks_by_music_style(_music_library, _requested_music_style, result \\ [])

  def get_tracks_by_music_style([] = music_library, requested_music_style, result) do
    if result == [] do
      {:error, :not_found}
    else
      {:ok, result}
    end
  end

  def get_tracks_by_music_style(
        [%Track{music_style: music_style} = track | tail] = music_library,
        requested_music_style,
        result
      )
      when music_style == requested_music_style do
    get_tracks_by_music_style(tail, requested_music_style, result ++ [track])
  end

  def get_tracks_by_music_style([head | tail] = music_library, requested_music_style, result) do
    get_tracks_by_music_style(tail, requested_music_style, result)
  end
end
