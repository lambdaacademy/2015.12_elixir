defmodule VotingService.Router do
  use VotingService.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VotingService do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/talks", TalkController

  end

  # Other scopes may use custom stacks.
  scope "/api", VotingService do
    pipe_through :api

    resources "/talks/", TalkApiController, except: [:new, :edit]

    post "/vote/:id", TalkApiController, :vote
  end
end
