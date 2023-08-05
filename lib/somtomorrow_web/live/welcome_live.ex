defmodule SomtomorrowWeb.WelcomeLive do
  @moduledoc false

  use SomtomorrowWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket, layout: {SomtomorrowWeb.Layouts, :empty}}
  end
end
