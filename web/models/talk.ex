defmodule VotingService.Talk do
  use VotingService.Web, :model

  schema "talks" do
    field :title, :string
    field :author, :string
    field :description, :string
    field :pluses, :integer, default: 0
    field :zeroes, :integer, default: 0
    field :minuses, :integer, default: 0

    timestamps
  end

  @required_fields ~w(title author description)
  @optional_fields ~w(pluses zeroes minuses)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
