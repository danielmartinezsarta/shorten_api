defmodule ShortenApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      ShortenApi.Repo,
      # Start the endpoint when the application starts
      ShortenApiWeb.Endpoint
      # Starts a worker by calling: ShortenApi.Worker.start_link(arg)
      # {ShortenApi.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShortenApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ShortenApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
