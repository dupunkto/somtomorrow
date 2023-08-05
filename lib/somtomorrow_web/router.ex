defmodule SomtomorrowWeb.Router do
  @moduledoc false

  use SomtomorrowWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {SomtomorrowWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SomtomorrowWeb do
    pipe_through :browser

    live "/", WelcomeLive, :welcome
    live "/page/schedule", ScheduleLive, :schedule
    live "/page/homework", HomeworkLive, :homework
    live "/page/grades", GradesLive, :grades
    live "/page/profile", ProfileLive, :profile

    # catch-all route
    live "/page/:id", WhoopsLive, :whoops
  end
end
