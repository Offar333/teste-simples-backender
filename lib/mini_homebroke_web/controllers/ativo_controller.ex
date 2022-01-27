defmodule MiniHomebrokeWeb.AtivoController do
  use MiniHomebrokeWeb, :controller

  alias MiniHomebroke.Ativos
  alias MiniHomebroke.Ativos.Ativo

  action_fallback MiniHomebrokeWeb.FallbackController

  def index(conn, _params) do
    ativos = Ativos.list_ativos()
    render(conn, "index.json", ativos: ativos)
  end

  def create(conn, %{"ativo" => ativo_params}) do
    with {:ok, %Ativo{} = ativo} <- Ativos.create_ativo(ativo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.ativo_path(conn, :show, ativo))
      |> render("show.json", ativo: ativo)
    end
  end

  def show(conn, %{"id" => id}) do
    ativo = Ativos.get_ativo!(id)
    json(conn, ativo)
  end

  def update(conn, %{"id" => id, "ativo" => ativo_params}) do
    ativo = Ativos.get_ativo!(id)

    with {:ok, %Ativo{} = ativo} <- Ativos.update_ativo(ativo, ativo_params) do
      render(conn, "show.json", ativo: ativo)
    end
  end

  def delete(conn, %{"id" => id}) do
    ativo = Ativos.get_ativo!(id)

    with {:ok, %Ativo{}} <- Ativos.delete_ativo(ativo) do
      send_resp(conn, :no_content, "")
    end
  end
end
