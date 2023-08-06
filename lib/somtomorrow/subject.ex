defmodule Somtomorrow.Subject do
  @moduledoc """
  A subject.
  """

  use TypedStruct

  typedstruct do
    field :name, String.t()
    field :acronym, String.t()
  end
end
