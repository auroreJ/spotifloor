defmodule Contexts.ListenerContext do
  use WhiteBread.Context
  alias Spotifloor.Listener

  given_ "a listener", fn state ->
    #given_listener
  end

  given_ "a premium listener", fn state ->
    #given_premium_listener
  end

end
