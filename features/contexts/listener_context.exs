defmodule Contexts.ListenerContext do
  use WhiteBread.Context
  alias Spotifloor.Listener

  given_ "a listener", fn state ->
    listener = %Listener{first_name: "listener_first_name", last_name: "listener_last_name", premium: "false"}
    {:ok, Map.put(state, :listener, listener)}
  end

  given_ "a premium listener", fn state ->
    listener = %Listener{first_name: "listener_first_name", last_name: "listener_last_name", premium: "true"}
    {:ok, Map.put(state, :listener, listener)}
  end

end
