# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
#
#     config :spacesuit, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:spacesuit, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#

# Turn off all file logging
config :logger, backends: [:console]
config :logger, level: String.to_atom(System.get_env("SPACESUIT_LOGGING_LEVEL") || "debug")

# Get rid of the execessive line feeding and level padding in
# the default Elixir logger.
config :logger, :console, format: "$time $metadata[$level] $message\n"

# Health route
config :spacesuit, :health_route, %{path: "/health", enabled: true}

# Do we call out to an external session service that can process JWT tokens?
config :spacesuit, session_service: %{enabled: false}

# Configuration for the CORS middleware
config :spacesuit,
  cors: %{
    # Main kill switch to disable the middleware
    enabled: false
    # Required prefix match in order to process CORS
    # path_prefixes: ["/matched"],
    # Maximum age for preflight requests
    # preflight_max_age: "3600",
    # Headers we validate for CORS
    # access_control_request_headers: ["X-Header1", "X-Header2"],
    # Allow access from any origin
    # any_origin_allowed: false,
    # Only allow CORS responses for these methods
    # allowed_http_methods: [:GET, :POST]
  }

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
import_config "#{Mix.env()}.exs"
