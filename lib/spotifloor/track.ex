defmodule Spotifloor.Track do
  use TypedStruct

  @typedoc "A track structure"
  typedstruct enforce: true do
    field(:music_style, atom())
    field(:title, String.t())
    field(:artist, String.t())
    field(:preview, boolean(), default: "false")
  end
end
