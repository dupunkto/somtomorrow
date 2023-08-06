defmodule Somtomorrow.Credentials do
  @moduledoc """
  Contains authentication data for communications with the Somtoday API.
  """

  use TypedStruct

  typedstruct do
    field :access_token, String.t()
    field :refresh_token, String.t()
  end
end
