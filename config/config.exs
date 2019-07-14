# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :shorten_api,
  ecto_repos: [ShortenApi.Repo]

# Configure your database
config :shorten_api, ShortenApi.Repo,
  adapter: EctoMnesia.Adapter

config :ecto_mnesia,
  host: {:system, :atom, "MNESIA_HOST", Kernel.node()},
  storage_type: {:system, :atom, "MNESIA_STORAGE_TYPE", :disc_copies}

config :mnesia,
  dir: 'priv/data/mnesia'

# Configures the endpoint
config :shorten_api, ShortenApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b3FE3tASq+aA+fLu53gjJrmLYfIRcJCN65M2bxYyQIuyGqFBwTMYASU4ezrYFkmA",
  render_errors: [view: ShortenApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ShortenApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
