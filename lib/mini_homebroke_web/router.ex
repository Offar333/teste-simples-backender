defmodule MiniHomebrokeWeb.Router do
  use MiniHomebrokeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MiniHomebrokeWeb do
    pipe_through :api

    get "/ordens/list/:codigo_ativo", OrdemController, :show_ordens
    resources "/ativos", AtivoController
    resources "/ordens", OrdemController
  end
end
