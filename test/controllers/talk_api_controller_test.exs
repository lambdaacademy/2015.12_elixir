defmodule VotingService.TalkApiControllerTest do
  use VotingService.ConnCase

  alias VotingService.Talk
  @valid_attrs %{author: "some content", description: "some content", minuses: 42, zeroes: 42, pluses: 42, title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, talk_api_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    talk_api = Repo.insert! %Talk{}
    conn = put conn, talk_api_path(conn, :update, talk_api), talk: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Talk, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    talk_api = Repo.insert! %Talk{}
    conn = put conn, talk_api_path(conn, :update, talk_api), talk: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "uses hardcoded update API from previous lambda days", %{conn: conn} do
    talk = Repo.insert! %Talk{}
    conn = post conn, "talk_api/update", id: talk.id, minus_votes: 1, zero_votes: 2, plus_votes: 4
  end

  test "uses hardcoded index API from previous lambda days", %{conn: conn} do
    talk_api = Repo.insert! %Talk{}
    conn = put conn, talk_api_path(conn, :update, talk_api), talk: @valid_attrs
    talks = Repo.all Talk
    conn = get conn, "talk_api/index"
    assert json_response(conn, 200)["talks"]
  end
end
