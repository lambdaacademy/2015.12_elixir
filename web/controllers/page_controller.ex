defmodule VotingService.PageController do
  use VotingService.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
