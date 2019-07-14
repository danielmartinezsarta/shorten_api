use Mix.Config

# Configure your database
config :shorten_api, ShortenApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "shorten_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :shorten_api, ShortenApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
