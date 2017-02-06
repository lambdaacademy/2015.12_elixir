use Mix.Config

config :voting_service, VotingService.Endpoint,
  secret_key_base: "OfVKC5xMNXxKeBcu0Ogx5a7XTcztWIzGFqlt4tDblwXkXVlNuoEiDkjVRQTpVs2H"

# Configure your database
config :voting_service, VotingService.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "voting_service",
  password: "voting_service",
  database: "voting_service",
  pool_size: 20
