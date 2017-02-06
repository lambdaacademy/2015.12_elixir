defmodule VotingService do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(VotingService.Endpoint, []),
      supervisor(VotingService.Repo, []),
    ]

    opts = [strategy: :one_for_one, name: VotingService.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    VotingService.Endpoint.config_change(changed, removed)
    :ok
  end
end
