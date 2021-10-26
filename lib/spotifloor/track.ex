defmodule Spotifloor.Track do
  @enforce_keys [:music_style, :title, :artist]
  defstruct music_style: nil, title: "", artist: "", preview: false
end
