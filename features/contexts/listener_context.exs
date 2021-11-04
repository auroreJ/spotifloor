defmodule Contexts.ListenerContext do
  use WhiteBread.Context
  alias Spotifloor.Listener

  given_ "a listener", fn state ->
    #given_listener
  end
end
