defmodule MiniHomebroke.Repo.Migrations.CreateOrdens do
  use Ecto.Migration

  def change do
    create table(:ordens) do
      add :codigo_ativo, references("ativos", column: "codigo", type: :string)
      add :tipo, :integer
      add :quantidade, :integer
      add :valor, :decimal

      timestamps()
    end
  end
end
