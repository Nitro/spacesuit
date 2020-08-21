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
      applications: [
        :logger,
        :cowboy,
        :hackney,
        :crypto,
        :jose,
        :new_relic_agent
      ],
      mod: {Spacesuit, []}
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
      {:poison, "~> 2.0"},
      {:httpoison, "~> 0.9.0"},
      {:jsx, "~> 2.8.0"},
      {:joken, "~> 1.4.1"},
      {:new_relic_agent, "~> 1.0"},

      # Test only
      {:excoveralls, "~> 0.6", only: :test},
      {:mock, "~> 0.3.5", only: :test},
      {:apex, "~>1.1.0"}
    ]
  end
end
