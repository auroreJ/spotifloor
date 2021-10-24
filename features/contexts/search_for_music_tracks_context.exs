defmodule Contexts.SearchForMusicTracksContext do
  use WhiteBread.Context

  import_steps_from Contexts.ListenerContext
  import_steps_from Contexts.MusicLibraryContext
end
