import Config

config :somtomorrow,
  namespace: Somtomorrow

config :somtomorrow, SomtomorrowWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: SomtomorrowWeb.ErrorHTML, json: SomtomorrowWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Somtomorrow.PubSub,
  live_view: [signing_salt: "gJcU3TqL"]

config :esbuild,
  # (the version is required)
  version: "0.17.11",
  default: [
    args: ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  # (the version is required)
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

# This must remain at the bottom of this file so it
# overrides the configuration defined above.
import_config "#{config_env()}.exs"
