defmodule Somtomorrow.Subject do
  @moduledoc """
  A subject.
  """

  use TypedStruct

  typedstruct do
    field :id, integer()
    field :name, String.t()
    field :acronym, String.t()
  end

  @spec from(map()) :: [t()]
  def from(%{"items" => items} = _json) do
    Enum.map(items, &from/1)
  end

  @spec from(map()) :: t()
  def from(json) do
    %{"naam" => name, "afkorting" => acronym} = json
    id = json |> Enum.get("links", []) |> hd() |> Enum.get("id")
    %__MODULE__{id: id, name: name, acronym: acronym}
  end
end
