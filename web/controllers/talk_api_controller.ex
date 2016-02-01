defmodule VotingService.TalkApiController do
  use VotingService.Web, :controller

  alias VotingService.Talk

  plug :scrub_params, "talk" when action in [:create, :update]

  def index(conn, _params) do
    talksapi = Repo.all(Talk)
    render(conn, "index.json", talksapi: talksapi)
  end

  def show(conn, %{"id" => id}) do
    talk_api = Repo.get!(Talk, id)
    render(conn, "show.json", talk_api: talk_api)
  end

  def update(conn, %{"id" => id, "talk" => talk_params}) do
    talk_api = Repo.get!(Talk, id)
    changeset = Talk.changeset(talk_api, talk_params)

    case Repo.update(changeset) do
      {:ok, talk_api} ->
        render(conn, "show.json", talk_api: talk_api)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(VotingService.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
