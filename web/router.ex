defmodule VotingService.Router do
  use VotingService.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/talk_api", VotingService do
    pipe_through :api

    get "/index", TalkApiController, :api_index
    post "/update", TalkApiController, :api_update
    resources "/", TalkApiController, except: [:new, :edit, :create, :delete, :show]
  end
end
