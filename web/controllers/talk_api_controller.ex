defmodule VotingService.TalkApiController do
  use VotingService.Web, :controller

  alias VotingService.Talk

  plug :scrub_params, "talk" when action in [:create, :update]

  def index(conn, _params) do
    talksapi = Repo.all(Talk)
    render(conn, "index.json", talksapi: talksapi)
  end

  def create(conn, %{"talk" => talk_params}) do
    changeset = Talk.changeset(%Talk{}, talk_params)

    case Repo.insert(changeset) do
      {:ok, talk_api} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", talk_api_path(conn, :show, talk_api))
        |> render("show.json", talk_api: talk_api)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(VotingService.ChangesetView, "error.json", changeset: changeset)
    end
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

  def vote(conn, %{"id" => id}) do
    talk = Repo.get!(Talk, id)
    changeset = Talk.changeset(talk, %{pluses: talk.pluses + 1})
    case Repo.update(changeset) do
      {:ok, talk_api} ->
        render(conn, "show.json", talk_api: talk_api)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(VotingService.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    talk_api = Repo.get!(Talk, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(talk_api)

    send_resp(conn, :no_content, "")
  end
end
