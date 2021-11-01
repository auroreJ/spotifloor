defmodule Spotifloor.Listener do
  use TypedStruct

  @typedoc "A listener structure"
  typedstruct enforce: true do
    field(:first_name, String.t())
    field(:last_name, String.t())
    field(:premium, boolean(), default: "false")
  end
end
