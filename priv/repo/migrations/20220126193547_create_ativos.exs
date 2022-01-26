defmodule MiniHomebroke.Repo.Migrations.CreateAtivos do
  use Ecto.Migration

  def change do
    create table(:ativos, primary_key: false) do
      add :codigo, :string, primary_key: true
      add :preco, :decimal

      timestamps()
    end
  end
end
