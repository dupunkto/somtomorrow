defmodule Somtomorrow do
  @moduledoc """
  Next-gen cross-platform Somtoday app with advanced features and modern design.
  """

  alias Somtomorrow.User
  alias Somtomorrow.Credentials
  alias Somtomorrow.Subject

  @base "https://api.somtoday.nl/rest/v1"

  @spec login(User.t()) :: {:ok, User.t()} | {:error, :incorrect_password}
  def login(%User{username: username, password: password} = user) do
    with {:ok, credentials} = fetch_credentials(username, password) do
      %User{user | credentials: credentials, password: nil}
    end
  end

  defp fetch_credentials(username, password)
  when is_binary(username) and is_binary(password) do
    # Hard code credentials for now. Later we will call a other server
    # that will obtain them by logging in via the JS puppeteer system.
    {:ok, %Credentials{access_token: "", refresh_token: ""}}
  end

  @spec subjects(User.t()) :: [Subject.t()]
  def subjects(%User{credentials: credentials}) do
    http_request(credentials, "#{@base}/vakken")
  end

  defp http_request(%Credentials{access_token: access_token}, endpoint) do
    Req.get!(endpoint, auth: {:bearer, access_token}, headers: {"Accept", "application/json"})
  end
end
