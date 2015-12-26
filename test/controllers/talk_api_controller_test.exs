defmodule VotingService.TalkApiControllerTest do
  use VotingService.ConnCase

  alias VotingService.TalkApi
  @valid_attrs %{author: "some content", description: "some content", minuses: 42, pluses: 42, title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, talk_api_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    talk_api = Repo.insert! %TalkApi{}
    conn = get conn, talk_api_path(conn, :show, talk_api)
    assert json_response(conn, 200)["data"] == %{"id" => talk_api.id,
      "title" => talk_api.title,
      "author" => talk_api.author,
      "description" => talk_api.description,
      "pluses" => talk_api.pluses,
      "minuses" => talk_api.minuses}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, talk_api_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, talk_api_path(conn, :create), talk_api: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(TalkApi, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, talk_api_path(conn, :create), talk_api: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    talk_api = Repo.insert! %TalkApi{}
    conn = put conn, talk_api_path(conn, :update, talk_api), talk_api: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(TalkApi, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    talk_api = Repo.insert! %TalkApi{}
    conn = put conn, talk_api_path(conn, :update, talk_api), talk_api: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    talk_api = Repo.insert! %TalkApi{}
    conn = delete conn, talk_api_path(conn, :delete, talk_api)
    assert response(conn, 204)
    refute Repo.get(TalkApi, talk_api.id)
  end
end
