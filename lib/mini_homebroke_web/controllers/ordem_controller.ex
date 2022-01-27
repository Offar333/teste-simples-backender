defmodule MiniHomebrokeWeb.OrdemController do
  use MiniHomebrokeWeb, :controller

  alias MiniHomebroke.Ordens
  alias MiniHomebroke.Ordens.Ordem

  action_fallback MiniHomebrokeWeb.FallbackController

  def index(conn, _params) do
    ordens = Ordens.list_ordens()
    render(conn, "index.json", ordens: ordens)
  end

  def create(conn, %{"ordem" => ordem_params}) do
    with {:ok, %Ordem{} = ordem} <- Ordens.create_ordem(ordem_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.ordem_path(conn, :show, ordem))
      |> render("show.json", ordem: ordem)
    end
  end

  def show(conn, %{"id" => id}) do
    ordem = Ordens.get_ordem!(id)
    render(conn, "show.json", ordem: ordem)
  end

  def show_ordens(conn, %{"codigo_ativo" => codigo_ativo}) do
    ordem = Ordens.get_operacao!(codigo_ativo)
    json(conn, ordem)
  end

  def update(conn, %{"id" => id, "ordem" => ordem_params}) do
    ordem = Ordens.get_ordem!(id)

    with {:ok, %Ordem{} = ordem} <- Ordens.update_ordem(ordem, ordem_params) do
      render(conn, "show.json", ordem: ordem)
    end
  end

  def delete(conn, %{"id" => id}) do
    ordem = Ordens.get_ordem!(id)

    with {:ok, %Ordem{}} <- Ordens.delete_ordem(ordem) do
      send_resp(conn, :no_content, "")
    end
  end
end
