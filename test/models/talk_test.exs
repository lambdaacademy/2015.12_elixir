defmodule VotingService.TalkTest do
  use ExUnit.Case

  alias VotingService.Talk

  @valid_attrs %{author: "some content", description: "some content", minuses: 42, zeroes: 12, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Talk.changeset(%Talk{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Talk.changeset(%Talk{}, @invalid_attrs)
    refute changeset.valid?
  end
end
