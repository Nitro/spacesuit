Spacesuit
=========

![spacesuit build](https://travis-ci.org/Nitro/spacesuit.svg?branch=master)

An API gateway written in Elixir, built on top of the Cowboy web server and
Hackney http client. Supports streaming requests, remapping by hostname, HTTP
method, and endpoint.

Sample config:
```ruby
  "[...]:_" => [ # Match any hostname/port
    { "/users/:user_id", %{
      description: "users to [::1]:9090",
      GET: "http://[::1]:9090/:user_id", # ipv6 localhost (thanks osx)
      POST: "http://[::1]:9090/:user_id"
    }},

    {"/users/something/:user_id", %{
      description: "users/something to [::1]:9090",
      all_actions: "http://[::1]:9090/something/:user_id"
    }},

    {"/[...]", %{
      description: "others to hacker news",
      destination: "https://news.ycombinator.com"
    }}
  ]
```

Installation
------------

You need to have Elixir and the BEAM VM installed. On OSX the easiest way to do
that is to `brew install elixir`. Next you need to install dependencies, with
`mix deps.get`. Now you're ready to roll.

Running
-------

Spacesuit listens on 8080 and waits for requests. You can start it up by running
`iex -S mix run` or `mix run --no-halt`.

Configuration
-------------

Spacesuit relies on the `mix` configuration system with a common config in
`config/config.exs` and environment based configs merged on top of that. If you
were running in the `dev` environment, for example, `config/config.exs` would
get loaded first and then `config/dev.exs` would be loaded afterward.
Additionally, it can be configured with some environment variables. The most
common of these are

* `MIX_ENV` which describes the current evironment
* `SPACESUIT_LOGGING_LEVEL` which is a string corresponding to the minimum level of
  logging we'll show in the console. (e.g. `SPACESUIT_LOGGING_LEVEL="warn"`)

If you use New Relic for monitoring your applications, you can also turn on basic
metric support in Spacesuit by providing the standard New Relic environment variable
for your license key:

* `NEW_RELIC_LICENSE_KEY` the string value containing your New Relic license, as
  provided to any other New Relic agent.

Coverage
--------

You can view the coverage output in test mode by running:
```
MIX_ENV=test mix coveralls.html
```
