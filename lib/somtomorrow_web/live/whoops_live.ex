defmodule SomtomorrowWeb.WhoopsLive do
  @moduledoc false

  use SomtomorrowWeb, :live_view

  def mount(_params, _session, socket) do
    # This page is just here as a catchall if we forget to
    # add a route. It is also needed for the new verified routes
    # thing to SHUT UP about dynamically generating routes :)
    {:ok, assign(socket, :support_address, "whoops@dupunkto.org")}
  end

  def render(assigns) do
    ~H"""
    <p>
      If you're reading this, something on our part has gone terrible horribly amazingly wrong.<br />
      Somehow you ended up at this page where you actually can't end up. It's just straight up
      impossible. So, ..., whoops?
    </p>

    <p>
      Anyways, please send us an email at
      <a href={"mailto:#{@support_address}"}><%= @support_address %></a>
      <br /> (yes that's actually our support address).
    </p>

    <p>
      PS: It is entirely possible that we added a new page and then totally forgot to add a route - fancy word
      for URL - to it. In any case, you should just consider this a little secret you found.<br />
      You managed to break our app. You're special!
    </p>
    """
  end
end
