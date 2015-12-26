defmodule VotingService.TalkApiView do
  use VotingService.Web, :view

  def render("index.json", %{talksapi: talksapi}) do
    %{data: render_many(talksapi, VotingService.TalkApiView, "talk_api.json")}
  end

  def render("show.json", %{talk_api: talk_api}) do
    %{data: render_one(talk_api, VotingService.TalkApiView, "talk_api.json")}
  end

  def render("talk_api.json", %{talk_api: talk_api}) do
    %{id: talk_api.id,
      title: talk_api.title,
      author: talk_api.author,
      description: talk_api.description,
      pluses: talk_api.pluses,
      minuses: talk_api.minuses}
  end
end
