defmodule Spotifloor.Listener do
  defstruct first_name: "", last_name: "", track_list: [], premium_member: false

  alias Spotifloor.Listener
  alias Spotifloor.MusicLibrary

  def get() do
    %Listener{first_name: "listener_first_name", last_name: "listener_last_name", track_list: []}
  end
end
