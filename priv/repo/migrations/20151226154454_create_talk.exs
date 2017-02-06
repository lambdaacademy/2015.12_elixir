defmodule VotingService.Repo.Migrations.CreateTalk do
  use Ecto.Migration

  def change do
    create table(:talks) do
      add :title, :string
      add :author, :string
      add :description, :string
      add :pluses, :integer
      add :minuses, :integer

      timestamps()
    end

  end
end
