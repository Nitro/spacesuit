defmodule Spacesuit.Mixfile do
  use Mix.Project
  use Mix.Config

  def build_embedded? do
    Mix.env() == :prod || Mix.env() == :dev
  end

  def project do
    [
      app: :spacesuit,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: build_embedded?(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      mod: {Spacesuit, []},
      extra_applications: []
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      # All envs
      {:hackney, "~> 1.7.1", override: true},
      {:cowboy, github: "extend/cowboy"},
      {:poison, "~> 3.0", override: true},
      {:jsx, "~> 2.8.0"},
      {:joken, "~> 1.4.1"},
      {:elixometer, github: "pinterest/elixometer"},
      {:exometer_newrelic_reporter, github: "nitro/exometer_newrelic_reporter"},
      {:lager, "3.2.4", override: true},
      {:lager_logger, github: "PSPDFKit-labs/lager_logger"},

      # Test only
      {:excoveralls, "~> 0.6", only: :test},
      {:mock, "~> 0.1.1", only: :test},
      {:mox, "~> 0.3.2", only: :test},
      {:apex, "~>1.1.0"}
    ]
  end

  config :logger,
    backends: [:console],
    compile_time_purge_level: :info
end
