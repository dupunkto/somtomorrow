defmodule SomtomorrowWeb.ProfileLive do
  @moduledoc false

  use SomtomorrowWeb, :live_view
  use SomtomorrowWeb.Tabs

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
