defmodule Somtomorrow.User do
  @moduledoc """
  Represents a user.
  """

  use TypedStruct

  alias Somtomorrow.Credentials

  typedstruct enforce: true do
    field :username, String.t()
    field :password, String.t() | nil
    field :credentials, Credentials.t() | nil
  end
end
