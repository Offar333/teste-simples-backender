defmodule MiniHomebrokeWeb.Router do
  use MiniHomebrokeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MiniHomebrokeWeb do
    pipe_through :api

    resources "/ativos", AtivoController
    resources "/ordens", OrdemController
  end
end
