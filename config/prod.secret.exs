use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :voting_service, VotingService.Endpoint,
  secret_key_base: "OfVKC5xMNXxKeBcu0Ogx5a7XTcztWIzGFqlt4tDblwXkXVlNuoEiDkjVRQTpVs2H"

# Configure your database
config :voting_service, VotingService.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "voting_service_prod",
  pool_size: 20
