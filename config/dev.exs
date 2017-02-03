use Mix.Config

config :spacesuit, jwt_secret: "secret"

# Set up routes for Spacesuit. These are keyed by hostname matching
# according to the rules defined by Cowboy:
# https://ninenines.eu/docs/en/cowboy/1.0/guide/routing/
#
# The content must be a list, to preserve route ordering since it's
# a fall-through list. Generally you want a catch-all route at the
# end of the list.

config :spacesuit, routes: %{
  ":_" => [ # Match any hostname
    { "/users/:user_id", %{
      description: "users to [::1]:9090",
      GET: "http://[::1]:9090/:user_id", # ipv6 localhost (thanks osx)
      POST: "http://[::1]:9090/:user_id"
    }},

    {"/users/something/:user_id", %{
      description: "users/something to [::1]:9090",
      GET: "http://[::1]:9090/something/:user_id"
    }},

    {"/[...]", %{
      description: "others to hacker news",
      destination: "https://news.ycombinator.com"
    }}
  ]

}