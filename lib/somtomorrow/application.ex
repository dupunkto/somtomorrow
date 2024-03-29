defmodule Somtomorrow.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Somtomorrow.Server,
      SomtomorrowWeb.Telemetry,
      {Phoenix.PubSub, name: Somtomorrow.PubSub},
      SomtomorrowWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Somtomorrow.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SomtomorrowWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
