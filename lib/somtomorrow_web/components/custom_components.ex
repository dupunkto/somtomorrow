defmodule SomtomorrowWeb.CustomComponents do
  @moduledoc """
  Pluto Components is a collection of standalone UI components,
  similar to `SomtomorrowWeb.CoreComponents`.

  Wheres `CoreComponents` only contains common, reusable components,
  `SomtomorrowWeb.CustomComponents` also features specific
  not-so-reusable components. They are meant to be used in combination
  with the normal `CoreComponents`.

  The components are automatically available in the entire web layer, just like
  Petal Components, and they are meant to be used in addition to Petal.
  """

  use Phoenix.Component

  import SomtomorrowWeb.CoreComponents

  @doc """
  The bar at the top of the page containing the page title and actions/tabs.
  """

  slot :inner_block, required: true

  def page_header(assigns) do
    ~H"""
    <header class="py-6 px-6 flex flex-row justify-between items-center border-b border-slate-200 dark:border-slate-700 dark:bg-slate-900 text-slate-800 dark:text-slate-100">
      <%= render_slot(@inner_block) %>
    </header>
    """
  end

  @doc """
  The page title.

  This component is generally used inside the
  `inner_block` of `page_header/1`.
  """

  slot :inner_block, required: true

  def page_title(assigns) do
    ~H"""
    <h1 class="text-2xl font-bold text-slate-900 dark:text-slate-50">
      <%= render_slot(@inner_block) %>
    </h1>
    """
  end

  @doc """
  Wrapper around the main content of an page.
  """

  slot :inner_block, required: true

  def page_content(assigns) do
    ~H"""
    <h1 class="flex-grow overflow-x-auto disable-scrollbars bg-white dark:bg-slate-800">
      <%= render_slot(@inner_block) %>
    </h1>
    """
  end

  @doc """
  A calendar widget.
  """

  def calendar(assigns) do
    ~H"""
    <div class="flex w-full flex-auto">
      <div class="w-14 flex-none bg-white dark:bg-slate-900 ring-1 ring-slate-100 dark:ring-slate-700">
      </div>
      <div class="grid flex-auto grid-cols-1 grid-rows-1">
        <div
          class="col-start-1 col-end-2 row-start-1 grid divide-y dark:divide-slate-700 divide-slate-100"
          style="grid-template-rows: repeat(48, minmax(3.5rem, 1fr))"
        >
          <div class="row-end-1 h-7"></div>
          <.calendar_line :for={line_number <- 0..24} number={line_number} />
        </div>
      </div>
    </div>
    """
  end

  defp calendar_line(assigns) do
    ~H"""
    <div>
      <div class="-ml-14 -mt-2.5 w-14 pr-2 text-right text-xs leading-5 text-slate-400">
        <%= "#{@number}:00" %>
      </div>
    </div>
    <div></div>
    """
  end

  @doc """
  The tab bar at the bottom of the page.
  """

  attr :tabs, :list, required: true, doc: "A list of `SomtomorrowWeb.Tab`"
  attr :selected_tab_id, :string, required: true

  def page_navigation(assigns) do
    ~H"""
    <nav class="p-4 border-t border-slate-200 bg-slate-50 dark:border-slate-700 dark:bg-slate-800">
      <ul class="grid grid-cols-4 text-slate-600 dark:text-slate-500 text-center">
        <.page_navigation_button :for={tab <- @tabs} tab={tab} selected?={tab.id == @selected_tab_id} />
      </ul>
    </nav>
    """
  end

  defp page_navigation_button(assigns) do
    ~H"""
    <li class={"list-none m-0 active:scale-[85%] active:opacity-70 transition-all duration-150 #{if @selected?, do: "text-slate-950 dark:text-white"}"}>
      <%= if @selected? do %>
        <span class="flex flex-col items-center gap-[2px]">
          <.icon name={"hero-#{@tab.icon}-solid"} class="w-7 h-7" />
          <span class="text-xs font-semibold"><%= @tab.title %></span>
        </span>
      <% else %>
        <.link navigate={"/page/#{@tab.id}"} class="flex flex-col items-center gap-[2px]">
          <.icon name={"hero-#{@tab.icon}"} class="w-7 h-7" />
          <span class="text-xs"><%= @tab.title %></span>
        </.link>
      <% end %>
    </li>
    """
  end
end
