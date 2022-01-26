defmodule MiniHomebrokeWeb.AtivoView do
  use MiniHomebrokeWeb, :view
  alias MiniHomebrokeWeb.AtivoView

  def render("index.json", %{ativos: ativos}) do
    %{data: render_many(ativos, AtivoView, "ativo.json")}
  end

  def render("show.json", %{ativo: ativo}) do
    %{data: render_one(ativo, AtivoView, "ativo.json")}
  end

  def render("ativo.json", %{ativo: ativo}) do
    %{
      id: ativo.id,
      codigo: ativo.codigo,
      preco: ativo.preco
    }
  end
end
