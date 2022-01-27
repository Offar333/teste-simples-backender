defmodule MiniHomebroke.Repo.Migrations.CreateOrdens do
  use Ecto.Migration

  def change do
    create table(:ordens) do
      add :codigo_ativo, references("ativos", column: "codigo", type: :string)
      add :tipo, :integer
      add :quantidade, :integer
      add :valor, :decimal, precision: 10, scale: 2

      timestamps()
    end
  end
end
