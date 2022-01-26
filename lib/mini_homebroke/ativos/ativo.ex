defmodule MiniHomebroke.Ativos.Ativo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:codigo, :string, []}
  @derive {Phoenix.Param, key: :codigo}
  schema "ativos" do
    field :preco, :decimal, precision: 2

    belongs_to :ordens, MiniHomebroke.Ordens.Ordem, references: :codigo_ativo

    timestamps()
  end

  @doc false
  def changeset(ativo, attrs) do
    ativo
    |> cast(attrs, [:codigo, :preco])
    |> validate_required([:codigo, :preco])
  end
end
