use Mix.Config

config :voting_service, VotingService.Endpoint,
  http: [port: 8080],
  url: [host: "localhost", port: 8080],
  server: true,
  root: ".",
  cache_static_manifest: "priv/static/manifest.json"

config :logger, level: :info

import_config "prod.secret.exs"
