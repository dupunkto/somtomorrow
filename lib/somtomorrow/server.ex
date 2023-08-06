defmodule Somtomorrow.Server do
  @moduledoc false

  use GenServer

  def start_link(args) do
    initial_state = initial_state(args)
    GenServer.start_link(__MODULE__, initial_state)
  end

  defp initial_state(_args) do
    nil
  end

  @impl true
  def init(state) do
    {:ok, state}
  end
end
