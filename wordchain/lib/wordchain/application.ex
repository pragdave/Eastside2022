defmodule Wordchain.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WordchainWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wordchain.PubSub},
      # Start the Endpoint (http/https)
      WordchainWeb.Endpoint
      # Start a worker by calling: Wordchain.Worker.start_link(arg)
      # {Wordchain.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wordchain.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WordchainWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
