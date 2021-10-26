defmodule Contexts.ListenerContext do
  use WhiteBread.Context
  alias Spotifloor.{Listener, MusicLibrary}

  given_ "a listener", fn state ->
        listener = Listener.get()
        state = Map.put(state, :listener, listener)
        {:ok, state}
  end
end
