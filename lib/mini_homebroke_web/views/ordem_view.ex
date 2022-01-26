defmodule MiniHomebrokeWeb.OrdemView do
  use MiniHomebrokeWeb, :view
  alias MiniHomebrokeWeb.OrdemView

  def render("index.json", %{ordens: ordens}) do
    %{data: render_many(ordens, OrdemView, "ordem.json")}
  end

  def render("show.json", %{ordem: ordem}) do
    %{data: render_one(ordem, OrdemView, "ordem.json")}
  end

  def render("ordem.json", %{ordem: ordem}) do
    %{
      id: ordem.id,
      codigo_ativo: ordem.codigo_ativo,
      tipo: ordem.tipo,
      quantidade: ordem.quantidade,
      valor: ordem.valor
    }
  end
end
