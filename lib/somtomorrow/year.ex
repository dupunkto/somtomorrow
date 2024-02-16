defmodule Somtomorrow.Year do
  @moduledoc """
  A school year.
  """

  use TypedStruct

  typedstruct do
    field :id, integer()
    field :name, String.t()
    field :current?, boolean()
    field :from, DateTime.t()
    field :to, DateTime.t()
  end

  @spec from(map()) :: [t()]
  def from(%{"items" => items} = _json) do
    Enum.map(items, &from/1)
  end

  @spec from(map()) :: t()
  def from(json) do
    %{"naam" => name, "isHuidig" => current?, "vanafDatum" => from, "totDatum" => to} = json
    id = json |> Enum.get("links", []) |> hd() |> Enum.get("id")
    %__MODULE__{id: id, name: name, current?: current?, from: Date.from_iso8601!(from), to: Date.from_iso8601!(to)}
  end
end
