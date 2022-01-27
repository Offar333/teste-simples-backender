defmodule MiniHomebroke.Repo.Migrations.CreateAtivos do
  use Ecto.Migration

  def change do
    create table(:ativos, primary_key: false) do
      add :codigo, :string, primary_key: true
      add :preco, :decimal, precision: 10, scale: 2

      timestamps()
    end
  end
end
