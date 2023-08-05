defmodule SomtomorrowWeb.Tab do
  @moduledoc false

  use TypedStruct

  typedstruct enforce: true do
    field :id, atom()
    field :title, String.t()
    field :icon, String.t()
  end
end
