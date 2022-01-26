defmodule MiniHomebroke.Ordens.Ordem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ordens" do
    field :codigo_ativo, :string
    field :quantidade, :integer
    field :tipo, :integer
    field :valor, :decimal, precision: 2

    has_many :ativos, MiniHomebroke.Ativos.Ativo, foreign_key: :codigo

    timestamps()
  end

  @doc false
  def changeset(ordem, attrs) do
    ordem
    |> cast(attrs, [:codigo_ativo, :tipo, :quantidade, :valor])
    |> validate_required([:codigo_ativo, :tipo, :quantidade, :valor])
  end
end
