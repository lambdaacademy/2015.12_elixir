defmodule VotingService.Repo.Migrations.AddZeroesToTalk do
  use Ecto.Migration

  def change do
    alter table(:talks) do
      add :zeroes, :integer
    end
  end
end
