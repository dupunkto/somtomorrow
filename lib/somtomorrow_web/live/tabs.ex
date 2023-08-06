defmodule SomtomorrowWeb.Tabs do
  @moduledoc """
  Hook for managing socket assigns regarding navigation.

  This hook manages the `@tab_id` `@page_title` and `@tabs` assigns on your LiveView.
  Only needed if the LiveView is using the `app.html` layout.
  It expects the LiveView it's mounted on to use a `live_action`.

  ## Usage

  Install it like this:

      use SomtomorrowWeb.Tabs

  And POOF! Magic!
  """

  use SomtomorrowWeb, :live_hook

  alias SomtomorrowWeb.Tab

  defmacro __using__(_opts) do
    quote do
      on_mount {unquote(__MODULE__), __MODULE__}
    end
  end

  @doc """
  The on_mount callback.
  """
  def on_mount(_liveview_module, _params, _session, %{assigns: %{live_action: tab_id}} = socket) do
    %Tab{title: page_title} = get_tab(tab_id)
    {:cont, assign(socket, tab_id: tab_id, page_title: page_title, tabs: tabs())}
  end

  defp tabs do
    [
      %Tab{
        id: :schedule,
        title: "Rooster",
        icon: "calendar" # hero-calendar hero-calendar-solid
      },
      %Tab{
        id: :homework,
        title: "Huiswerk",
        icon: "pencil" # hero-pencil hero-pencil-solid
      },
      %Tab{
        id: :grades,
        title: "Cijfers",
        icon: "academic-cap" # hero-academic-cap hero-academic-cap-solid
      },
      %Tab{
        id: :profile,
        title: "Profiel",
        icon: "user-circle" # hero-user-circle hero-user-circle-solid
      }
    ]
  end

  defp get_tab(tab_id) do
    [tab] = Enum.filter(tabs(), & &1.id == tab_id)
    tab
  end
end
